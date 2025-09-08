
Build Immortalwrt for CMCC RAX3000Q/QY using GitHub Actions

Kernel Version : 5.4-QSDK

- Support IPV6
- Support Wi-Fi NSS
- Support NAT NSS
- Support Wireless Relay/Repeater

## 无线中继功能使用说明

### 功能简介
无线中继（Wireless Relay）功能允许RAX3000Q路由器连接到上游WiFi网络，并通过自身的无线信号进行扩展，从而扩大WiFi覆盖范围。

### 配置步骤
1. **刷入固件**：
   - 使用最新编译的固件刷入路由器
   - 等待路由器完成启动

2. **访问管理页面**：
   - 默认管理IP地址：`192.168.10.1`
   - 使用浏览器访问该地址进行配置

2. **登录管理界面**：
   - 将设备连接到路由器的WiFi或LAN口
   - 浏览器访问 http://192.168.1.1
   - 使用默认密码登录（如果已修改请使用修改后的密码）

3. **配置无线中继**：
   - 进入"网络" -> "无线"菜单
   - 找到名为"relay_radio0"的接口（5GHz中继接口）
   - 点击"编辑"按钮
   - 修改"ESSID"为上游WiFi的名称
   - 修改"加密方式"和"密码"为上游WiFi的加密方式和密码
   - 取消勾选"禁用"选项
   - 点击"保存并应用"

4. **验证连接**：
   - 进入"状态" -> "概览"页面
   - 检查"wwan"接口是否已获取IP地址
   - 如果成功连接，您将看到上游WiFi分配的IP地址

5. **高级设置**（可选）：
   - 如需修改中继模式下的IP地址，可编辑/etc/config/network文件
   - 如需设置WiFi定时开关，可使用"服务" -> "WiFi定时"功能

### 故障排除
- **无法连接上游WiFi**：
  - 确认上游WiFi名称和密码输入正确
  - 检查信号强度，确保路由器在上游WiFi覆盖范围内
  - 尝试将路由器放置在更靠近上游WiFi的位置

- **连接成功但无法上网**：
  - 检查上游WiFi是否能正常访问互联网
  - 检查防火墙设置，确保wwan接口已添加到wan区域

- **中继模式下WiFi信号弱**：
  - 调整路由器位置，使其既能接收到上游WiFi信号，又能覆盖目标区域
  - 考虑使用5GHz频段进行中继，减少干扰

## 使用GitHub Actions编译固件

### 编译方式
本项目使用GitHub Actions进行固件编译。编译完成后，固件将自动上传到GitHub Artifacts和Releases。

### 手动触发编译
1. **Fork本仓库**：
   - 访问[本仓库](https://github.com/CHUN71-DROID/Actions-OpenWrt-RAX3000Q)
   - 点击右上角的"Fork"按钮，将仓库复制到您的GitHub账号下

2. **触发编译**：
   - 在您fork的仓库中，点击"Actions"选项卡
   - 在左侧找到"Build RAX3000Q OpenWrt"工作流
   - 点击"Run workflow"按钮
   - 如需SSH调试，可选择"SSH connection to Actions"选项
   - 点击"Run workflow"开始编译

3. **获取编译结果**：
   - 编译完成后，可在"Actions"页面查看编译日志
   - 编译成功后，固件将上传到"Artifacts"和"Releases"
   - 在"Artifacts"中可下载完整的bin目录和固件
   - 在"Releases"中可下载最终的固件文件

### 自定义编译
如需自定义编译选项，可修改以下文件：
- `.config`：OpenWrt编译配置文件
- `diy-part1.sh`：编译前脚本，用于修改feeds源
- `diy-part2.sh`：编译后脚本，用于定制固件

修改完成后，提交更改并触发工作流即可开始自定义编译。

Base from [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

Get SSH: [GetSSH](https://hugo.utermux.dev/default/rax3000q-latest/)

UBoot: [UBoot](https://github.com/hzyitc/openwrt-redmi-ax3000/issues/73#issuecomment-2259591683) Set computer ip to:192.168.1.8, use LAN1 port.

## Acknowledgments

- [Microsoft](https://www.microsoft.com)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub](https://github.com)
- [GitHub Actions](https://github.com/features/actions)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cisco](https://www.cisco.com/)
- [ImmortalWrt](https://github.com/kkstone/immortalwrt-ipq50xx)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © P3TERX 
