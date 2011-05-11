Factory.define :film do |film|
  film.name 'test'
  film.url 'test/url.html'
  film.description 'test description'
  film.rating 3
end

Factory.define :admin do |admin|
  admin.email 'test@xyz.co.uk'
  admin.password 'abcdef'
end

Factory.define :user do |user|
  user.email 'test@xyz.co.uk'
  user.password 'abcdef'
end