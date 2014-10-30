DISCIPLINES = ["Physics", "Chemistry", "Earth Science", "Geology", "Meteorology", "Biology", "Botany", "Astronomy", "Nuclear Physics", "Physical Chemistry", "Organic Chemistry", "Inorganic Chemistry", "Ecology", "Genetics"]

50.times do 
	User.create!(
		first_name:    Faker::Name.first_name,
		last_name:     Faker::Name.last_name,
		email:         Faker::Internet.email,
		password:      "password",
		institution:   Faker::Company.name,
		linked_in_url: "http://linkedin.com/pub/#{Faker::Name.first_name}-#{Faker::Name.last_name}/#{rand(100..10000)}",
		profile_pic:   "/app/assets/images/cookie_squirrel.jpg",
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

# at this point, there are 50 users and 10 posters, which were "uploaded" by the first 10 users

10.times do |i|
	UserPoster.create!(
		user_id:   i,
		poster_id: i
		)
end

# now the users who created the 10 posters are associated with the poster not only as a creator, but also as an author

UserPoster.create(
	user_id:   2,
	poster_id: 1 
	)

UserPoster.create(
	user_id:   20,
	poster_id: 1 
	)

UserPoster.create(
	user_id:   45,
	poster_id: 1 
	)

# now poster 1 has 4 users associated with it 

UserPoster.create(
	user_id:   24,
	poster_id: 2 
	)

UserPoster.create(
	user_id:   18,
	poster_id: 2 
	)

# poster 2 has 3 users associated with it

UserPoster.create(
	user_id:   12,
	poster_id: 3 
	)

UserPoster.create(
	user_id:   37,
	poster_id: 3 
	)

UserPoster.create(
	user_id:   42,
	poster_id: 3 
	)

# poster 3 has 4 users associated with it

UserPoster.create(
	user_id:   29,
	poster_id: 4 
	)

UserPoster.create(
	user_id:   2,
	poster_id: 4 
	)

UserPoster.create(
	user_id:   17,
	poster_id: 4 
	)

UserPoster.create(
	user_id:   35,
	poster_id: 4 
	)

UserPoster.create(
	user_id:   50,
	poster_id: 4 
	)

UserPoster.create(
	user_id:   40,
	poster_id: 4 
	)

# poster 4 has 7 users associated with it

UserPoster.create(
	user_id:   11,
	poster_id: 5 
	)

UserPoster.create(
	user_id:   8,
	poster_id: 5 
	)

UserPoster.create(
	user_id:   5,
	poster_id: 5 
	)

UserPoster.create(
	user_id:   9,
	poster_id: 5 
	)

# poster 5 has 5 users associated with it

UserPoster.create(
	user_id:   19,
	poster_id: 6 
	)

# poster 6 has 2 users associated with it

UserPoster.create(
	user_id:   37,
	poster_id: 7 
	)

UserPoster.create(
	user_id:   43,
	poster_id: 7 
	)

UserPoster.create(
	user_id:   19,
	poster_id: 7 
	)

UserPoster.create(
	user_id:   9,
	poster_id: 7 
	)

# poster 7 has 5 users associated with it

# poster 8 has only 1 user associated with it

UserPoster.create(
	user_id:   24,
	poster_id: 9 
	)

UserPoster.create(
	user_id:   18,
	poster_id: 9 
	)

# poster 9 has 3 users associated with it

UserPoster.create(
	user_id:   7,
	poster_id: 10 
	)

UserPoster.create(
	user_id:   18,
	poster_id: 10 
	)

UserPoster.create(
	user_id:   30,
	poster_id: 10 
	)

UserPoster.create(
	user_id:   12,
	poster_id: 10 
	)

# poster 10 has 5 users associated with it

50.times do 
	Comment.create!(
		text:             Faker::Lorem.paragraph(rand(2..12)),
		user_id:          rand(1..50),
		points:           rand(0..20),
		commentable_type: "poster", # is this right?
		commentable_id:   rand(1..10)
		)
end

50.times do 
	Comment.create!(
		text:             Faker::Lorem.paragraph(rand(2..12)),
		user_id:          rand(1..50),
		points:           rand(0..20),
		commentable_type: "comment", # is this right?
		commentable_id:   rand(1..25)
		)
end


20.times do 
	Comment.create!(
		text:             Faker::Lorem.paragraph(rand(2..12)),
		user_id:          rand(1..50),
		points:           rand(0..20),
		commentable_type: "comment", # is this right?
		commentable_id:   rand(35..60)
		)
end

# make a constant that is an array of disciplines, use index to create tags

DISCIPLINES.each do |discipline|
	Tag.create!(discipline: discipline)
end

4.times do 
	PosterTag.create!(
		poster_id: 1,
		tag_id:    rand(1..14)
		)
end

1.times do 
	PosterTag.create!(
		poster_id: 2,
		tag_id:    rand(1..14)
		)
end

3.times do 
	PosterTag.create!(
		poster_id: 3,
		tag_id:    rand(1..14)
		)
end

5.times do 
	PosterTag.create!(
		poster_id: 4,
		tag_id:    rand(1..14)
		)
end

1.times do 
	PosterTag.create!(
		poster_id: 5,
		tag_id:    rand(1..14)
		)
end

6.times do 
	PosterTag.create!(
		poster_id: 6,
		tag_id:    rand(1..14)
		)
end

3.times do 
	PosterTag.create!(
		poster_id: 7,
		tag_id:    rand(1..14)
		)
end

2.times do 
	PosterTag.create!(
		poster_id: 8,
		tag_id:    rand(1..14)
		)
end

1.times do 
	PosterTag.create!(
		poster_id: 9,
		tag_id:    rand(1..14)
		)
end

3.times do 
	PosterTag.create!(
		poster_id: 10,
		tag_id:    rand(1..14)
		)
end
