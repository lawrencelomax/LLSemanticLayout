Pod::Spec.new do |s|
    s.name = 'LLSemanticLayout'
    s.version = '0.0.1'
    s.summary = 'A library for simplifying view layout by making it more concice.'
    s.license = {
      :type => 'MIT',
      :file => 'LICENSE'
    }
    s.source = { :git => 'https://github.com/lawrencelomax/LLSemanticLayout.git', :commit => '0c945260a404d5b685ea8dd4a21badcc27b8a31b' }
    s.author = 'Lawrence Lomax'
    s.homepage = 'https://github.com/lawrencelomax/LLSemanticLayout'
    s.platform = :ios, '5.0'
    s.source_files = 'LLSemanticLayout/Classes/'
    s.requires_arc = true
end