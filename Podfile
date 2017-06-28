#inhibit_all_warnings 
platform :ios, '8.0'

source 'https://github.com/CocoaPods/Specs.git'

def common_pods
    #网络
    pod 'AFNetworking'
    #图片
    pod 'SDWebImage'
    #网络状态
    pod 'Reachability'
    #自动布局
    pod 'Masonry'
    #自动布局自动设置约束为0
    pod 'UIView+FDCollapsibleConstraints'
    #Route跳转
    pod 'JLRoutes'
    #网络打印LOG
    pod 'AFNetworkActivityLogger'
    #URL各部分快速拼接获取
    pod 'RequestUtils'
    #Model解析
    pod 'JSONModel'
    #HUD
    pod 'MBProgressHUD'
    #一个版本只触发一次
    pod 'AFOnceKit'
    #提示去APPStore打分工具
    pod 'iRate'
    #下拉上拉刷新
    pod 'MJRefresh'
end



target 'YFDefaultProject' do
    common_pods
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          config.build_settings['APPLICATION_EXTENSION_API_ONLY'] = 'NO'
      end
  end
end
