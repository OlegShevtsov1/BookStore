if Category.count.zero?
  Category.create!(name: 'Mobile Development')
  Category.create!(name: 'Photo')
  Category.create!(name: 'Web Design')
end

if Author.count.zero?
  Author.create!(name: 'John Horton')
  Author.create!(name: 'Bass Jobsen')
  Author.create!(name: 'David Cochran')
  Author.create!(name: 'Ian Whitley')
  Author.create!(name: 'Vitaly Friedman')
  Author.create!(name: 'Daniel Mall')
end

if Book.count.zero?
  Book.create!(name:        'Real-Life Responsive Web Design',
               description: 'Smart front-end techniques and design patterns derived from real-life
responsive projects.',
               category_id: 3)
  Book.create!(name:        'Android Programming for Beginners',
               description: 'Smashing Book 5: Real-Life Responsive Web Design is our brand new.',
               category_id: 1)
  Book.create!(name:        'Android Programming for Beginners',
               description: 'Smashing Book 5: Real-Life Responsive Web Design is our brand new.',
               category_id: 1)
end

if BookAuthor.count.zero?
  BookAuthor.create!(book_id: 1, author_id: 5)
  BookAuthor.create!(book_id: 1, author_id: 6)
  BookAuthor.create!(book_id: 2, author_id: 1)
  BookAuthor.create!(book_id: 3, author_id: 2)
  BookAuthor.create!(book_id: 3, author_id: 3)
  BookAuthor.create!(book_id: 3, author_id: 4)
end
