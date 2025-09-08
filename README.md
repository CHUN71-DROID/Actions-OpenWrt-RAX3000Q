
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
