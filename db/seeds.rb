# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# You can remove the 'faker' gem if you don't want Decidim seeds.
Decidim.seed!

require "decidim/faker/localized"

organization = Decidim::Organization.first

4.times do |x|
  Desfake::Itinerary.create!(
    title: Decidim::Faker::Localized.sentence(word_count: 5),
    subtitle: Decidim::Faker::Localized.sentence(word_count: 10),
    description: Decidim::Faker::Localized.paragraph(sentence_count: 1),
    body: Decidim::Faker::Localized.wrapped("<p>", "</p>") do
      Decidim::Faker::Localized.paragraph(sentence_count: 5)
    end,
    subscription: x.zero? ? :free : :premium,
    organization: organization,
    participatory_processes: [Decidim::ParticipatoryProcess.where(organization: organization).all.sample],
    hero_image: ActiveStorage::Blob.create_and_upload!(
      io: File.open(File.join(__dir__, "seeds/city.jpeg")),
      filename: "hero_image.jpeg",
      content_type: "image/jpeg",
      metadata: nil
    )
  )
end
