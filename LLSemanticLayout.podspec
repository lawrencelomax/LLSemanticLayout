Pod::Spec.new do |s|
    s.name = 'LLSemanticLayout'
    s.version = '0.0.1'
    s.summary = 'A library for simplifying view layout by making it more concice.'
    s.license = {
      :type => 'MIT',
      :file => 'LICENSE'
    }
    s.source = { :git => 'https://github.com/lawrencelomax/LLSemanticLayout.git', :commit => '669d73302b41557e7d87f78501fe1c538d5b69c9' }
    s.author = 'Lawrence Lomax'
    s.homepage = 'https://github.com/lawrencelomax/LLSemanticLayout'
    s.platform = :ios, '5.0'
    s.source_files = 'LLSemanticLayout/Classes/'
    s.requires_arc = true
end