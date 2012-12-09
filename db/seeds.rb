# encoding: utf-8

# Project.create! do |project|
#   project.title = 'Sed posuere consectetur est at lobortis.'
#   project.image = File.open(Rails.root.join('db/seeds/images/sports1.jpg'))
#   project.body = '<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Donec ullamcorper nulla non metus auctor fringilla. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Aenean lacinia bibendum nulla sed consectetur. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>'
#   project.name = 'Sit Magna'
#   project.location = 'Brasília-DF'
#   project.excerpt = 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
#   project.goal = 3400
#   project.expires_at = Date.today + 2.months
#   project.published = true
#   project.featured = true
# end

# Project.create! do |project|
#   project.title = 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.'
#   project.image = File.open(Rails.root.join('db/seeds/images/sports2.jpg'))
#   project.body = '<p></p>'
#   project.name = 'Ligula Ultricies'
#   project.location = 'Rio de Janeiro-RJ'
#   project.excerpt = 'Maecenas faucibus mollis interdum.'
#   project.goal = 5400
#   project.expires_at = Date.today + 2.months
#   project.published = true
#   project.featured = true
# end

# Project.create! do |project|
#   project.title = 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
#   project.image = File.open(Rails.root.join('db/seeds/images/sports3.jpg'))
#   project.body = '<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>'
#   project.name = 'Ligula Ultricies'
#   project.location = 'São Paulo-SP'
#   project.excerpt = 'Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.'
#   project.goal = 3200
#   project.expires_at = Date.today + 2.months
#   project.published = true
#   project.featured = true
# end

# Project.create! do |project|
#   project.title = 'Nullam id dolor id nibh ultricies vehicula ut id elit.'
#   project.image = File.open(Rails.root.join('db/seeds/images/sports4.jpg'))
#   project.body = '<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Nulla vitae elit libero, a pharetra augue. Aenean lacinia bibendum nulla sed consectetur. Nullam id dolor id nibh ultricies vehicula ut id elit. Nulla vitae elit libero, a pharetra augue.</p>'
#   project.name = 'Tortor Venenatis'
#   project.location = 'Brasília-DF'
#   project.excerpt = 'Etiam porta sem malesuada magna mollis euismod.'
#   project.goal = 7830
#   project.expires_at = Date.today + 2.months
#   project.published = true
#   project.featured = false
# end

# Project.create! do |project|
#   project.title = 'Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.'
#   project.image = File.open(Rails.root.join('db/seeds/images/sports5.jpg'))
#   project.body = '<p>Nullam id dolor id nibh ultricies vehicula ut id elit. Aenean lacinia bibendum nulla sed consectetur. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas faucibus mollis interdum.</p>'
#   project.name = 'Dapibus Euismod'
#   project.location = 'São Paulo-SP'
#   project.excerpt = 'Cras mattis consectetur purus sit amet fermentum.'
#   project.goal = 2360
#   project.expires_at = Date.today + 2.months
#   project.published = true
#   project.featured = false
# end

# Project.all.each do |project|
#   (0..100).to_a.sample.times do
#     Payment.create! do |payment|
#       payment.amount = (60..100).to_a.sample
#       payment.token = SecureRandom.urlsafe_base64(19)
#       payment.identifier = SecureRandom.urlsafe_base64(16)
#       payment.payer_id = SecureRandom.urlsafe_base64(12)
#       payment.completed = true
#       payment.user = User.all.to_a.sample
#       payment.project = project
#    end
#   end
# end

