/* interval between updates (in ms) */
const unsigned int interval = 1000;

/* text to show if no value can be retrieved */
static const char unknown_str[] = "n/a";

/* maximum output string length */
#define MAXLEN 2048

static const struct arg args[] = {
  /* function, format, argument */
	{ ipv4, "(%s) ", "eth0" },
	{ cpu_perc, "\uE0B3 \uE3BE  CPU: %s%% ", NULL },
	{ ram_perc, "| RAM: %s%% ", NULL },
	{ datetime, "\uE0B3 \uF64F  %s", "%F %T" },
};
