# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Classworks extension
Refinery::Classworks::Engine.load_seed

# Added by Refinery CMS Homeworks extension
Refinery::Homeworks::Engine.load_seed

# Added by Refinery CMS Long Term Assignments extension
Refinery::LongTermAssignments::Engine.load_seed

# Added by Refinery CMS Examples extension
Refinery::Examples::Engine.load_seed
