#!/usr/bin/env node
// Formats pi's `--mode json` event stream (JSONL on stdin) into readable CI log lines.
// Records are split on LF only, per docs/json.md.

const out = process.stdout;
let buf = '';
let atLineStart = true;
let toolCount = 0;
let toolNames = new Map();
let failed = false;

function line(s) {
  if (!atLineStart) out.write('\n');
  out.write(s + '\n');
  atLineStart = true;
}

function text(s) {
  out.write(s);
  atLineStart = s.endsWith('\n');
}

function short(v, max = 200) {
  const raw = typeof v === 'string' ? v : JSON.stringify(v ?? '');
  const one = raw.replace(/\s+/g, ' ').trim();
  return one.length > max ? `${one.slice(0, max)}…` : one;
}

function onEvent(ev) {
  switch (ev.type) {
    case 'session':
      line(`[session] ${ev.id} (${ev.cwd})`);
      break;
    case 'agent_start':
      line('[agent] start');
      break;
    case 'turn_start':
      line('[turn] start');
      break;
    case 'message_update': {
      const a = ev.assistantMessageEvent || {};
      if (a.type === 'text_delta') text(a.delta);
      else if (a.type === 'error') line(`[stream error] ${short(a.error ?? a.reason)}`);
      break;
    }
    case 'message_end':
      if (ev.message?.role === 'assistant' && !atLineStart) line('');
      break;
    case 'tool_execution_start': {
      toolCount += 1;
      toolNames.set(ev.toolCallId, ev.toolName);
      line(`[tool ${toolCount}] ${ev.toolName} ${short(ev.args, 300)}`);
      break;
    }
    case 'tool_execution_end': {
      const name = ev.toolName || toolNames.get(ev.toolCallId) || 'tool';
      const ms = ev.durationMs == null ? '' : ` (${Math.round(ev.durationMs)}ms)`;
      if (ev.isError) failed = true;
      line(`[tool ${toolCount}] ${ev.isError ? 'FAILED' : 'ok'} ${name}${ms}`);
      break;
    }
    case 'compaction_start':
      line(`[compaction] ${ev.reason}`);
      break;
    case 'agent_end':
      if (ev.willRetry) line('[agent] retrying');
      break;
    case 'agent_settled':
      line(`[agent] settled${ev.aborted ? ' (aborted)' : ''}`);
      break;
    default:
      break;
  }
}

process.stdin.setEncoding('utf8');
process.stdin.on('data', (chunk) => {
  buf += chunk;
  let idx;
  while ((idx = buf.indexOf('\n')) >= 0) {
    const rec = buf.slice(0, idx).replace(/\r$/, '');
    buf = buf.slice(idx + 1);
    if (!rec.trim()) continue;
    try {
      onEvent(JSON.parse(rec));
    } catch {
      line(`[unparsed] ${short(rec)}`);
    }
  }
});

process.stdin.on('end', () => {
  if (buf.trim()) {
    try {
      onEvent(JSON.parse(buf));
    } catch {
      line(`[unparsed] ${short(buf)}`);
    }
  }
  if (!atLineStart) out.write('\n');
  if (failed) line('[agent] some tool calls failed');
});
