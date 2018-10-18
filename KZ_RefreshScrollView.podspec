
Pod::Spec.new do |s|

    s.name = 'KZ_RefreshScrollView'
    s.version = '0.1.3'
    s.summary = 'iOS refresh and load more.'
    s.homepage = 'https://github.com/KieronZhang/KZ_RefreshScrollView'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang' => 'https://github.com/KieronZhang'}

    s.source = {:git => 'https://github.com/KieronZhang/KZ_RefreshScrollView.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.requires_arc = true

    s.ios.frameworks = 'Foundation', 'UIKit'

    s.ios.deployment_target = '8.0'

    s.ios.vendored_frameworks = 'KZ_RefreshScrollView/KZ_RefreshScrollView_iOS.framework'

    s.ios.resource = 'KZ_RefreshScrollView/KZ_RefreshScrollView_Bundle.bundle'

    s.dependency 'KZ_Categories'
    s.dependency 'KZ_MacroDefinition'

end
