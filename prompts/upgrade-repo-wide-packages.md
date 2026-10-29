# 升级仓库软件包

帮我看下 packages/ 下面的软件包有什么可以升级的, 联网获取软件包的最新版本

帮我升级到最新, 通过 x86-64_linux 和 aarch64-linux 的编译

## test

要测试软件包是能够编译出来的

```text
nix build .#${package_name}
```

## commit

只 commit 这个软件包的变更，每次完成一个包的升级就 commit, commit message 使用下面的要求


```text
package($package_name): bump $old_version -> $new_version
```

