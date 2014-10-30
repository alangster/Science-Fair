50.times do 
	User.create!(
		first_name:    Faker::Name.first_name,
		last_name:     Faker::Name.last_name,
		email:         Faker::Internet.email,
		password:      "password",
		institution:   Faker::Company.name,
		linked_in_url: "http://linkedin.com/pub/#{Faker::Name.first_name}-#{Faker::Name.last_name}/#{rand(100..10000)}",
		profile_pic:   "",
		degree:        ["PhD", "MD", "MS", "BA", "BS", "MSc"].sample,
		points:        rand(0..90)
		)
end

10.times do |i|
	Poster.create!(
		title:    Faker::Company.catch_phrase,
		abstract: Faker::Lorem.paragraph(20),
		filepath: "",
		points:   rand(0..100),
		user_id:  i
		)
end

# at this point, there are 50 users, 

60.times do 
	UserPoster.create!(
		user_id: rand()
		)
end


