
Pod::Spec.new do |s|

    s.name = 'KZ_RefreshScrollView'
    s.version = '0.1.1'
    s.summary = 'iOS refresh and load more.'
    s.homepage = 'https://github.com/KieronZhang/KZ_RefreshScrollView'
    s.license = {:type => 'MIT', :file => 'LICENSE'}
    s.author = {'KieronZhang.' => 'https://github.com/KieronZhang'}
    s.platform = :ios, '8.0'
    s.source = {:git => 'https://github.com/KieronZhang/KZ_RefreshScrollView.git', :tag => s.version, :submodules => true}
    s.xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
    s.resource = 'KZ_RefreshScrollView/KZ_RefreshScrollViewBundle.bundle'
    s.frameworks = 'UIKit', 'Foundation'
    s.vendored_frameworks = 'KZ_RefreshScrollView/KZ_RefreshScrollViewFramework.framework'
    s.requires_arc = true

    s.dependency 'KZ_Categories'
    s.dependency 'KZ_MacroDefinition'

end
