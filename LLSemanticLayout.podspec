Pod::Spec.new do |s|
    s.name = 'LLSemanticLayout'
    s.version = '0.0.1'
    s.summary = 'A library for simplifying view layout by making it more concice.'
    s.license = {
      :type => 'MIT',
      :file => 'LICENSE'
    }
    s.source = { :git => 'https://github.com/lawrencelomax/LLSemanticLayout.git', :commit => 'e436fbe7c1d2244328c52b70c4f1fef0cc19058a' }
    s.author = 'Lawrence Lomax'
    s.homepage = 'https://github.com/lawrencelomax/LLSemanticLayout'
    s.platform = :ios, '5.0'
    s.source_files = 'LLSemanticLayout/Classes/'
    s.requires_arc = true
end