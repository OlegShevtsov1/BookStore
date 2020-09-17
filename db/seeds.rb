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
  Book.create!(name: 'Real-Life Responsive Web Design',
               description: 'Smashing Book 5: Real-Life Responsive Web Design is our brand new, upcoming book with
                             smart front-end techniques and design patterns derived from real-life responsive projects.
                             With 13 chapters on responsive workflow, SVG, Flexbox, Web fonts, responsive images,
                             responsive email, content strategy, debugging ...',
               year: 2016,
               price: 32.90,
               heigth: 6.4,
               width: 0.9,
               depth: 5.0,
               material: 'Hardcove, glossy paper',
               category_id: 3)
  Book.create!(name: 'Real-Life Responsive Web Design',
               description: 'Smashing Book 5: Real-Life Responsive Web Design is our brand new, upcoming book with
                             smart front-end techniques and design patterns derived from real-life responsive projects.
                             With 13 chapters on responsive workflow, SVG, Flexbox, Web fonts, responsive images,
                             responsive email, content strategy, debugging ...',
               year: 2016,
               price: 32.90,
               heigth: 6.4,
               width: 0.9,
               depth: 5.0,
               material: 'Hardcove, glossy paper',
               category_id: 1)
  Book.create!(name: 'Real-Life Responsive Web Design',
               description: 'Smashing Book 5: Real-Life Responsive Web Design is our brand new, upcoming book with
                             smart front-end techniques and design patterns derived from real-life responsive projects.
                             With 13 chapters on responsive workflow, SVG, Flexbox, Web fonts, responsive images,
                             responsive email, content strategy, debugging ...',
               price: 32.90,
               heigth: 6.4,
               width: 0.9,
               depth: 5.0,
               material: 'Hardcove, glossy paper',
               category_id: 2)
  Book.create!(name: 'Android Programming for Beginners',
               description: 'Smashing Book 5: Real-Life Responsive Web Design is our brand new.',
               year: 2016,
               price: 28.50,
               heigth: 6.4,
               width: 0.9,
               depth: 5.0,
               material: 'Hardcove, glossy paper',
               category_id: 2)
  Book.create!(name: 'Android Programming for Beginners',
               description: 'Smashing Book 5: Real-Life Responsive Web Design is our brand new.',
               year: 2016,
               price: 28.50,
               heigth: 6.4,
               width: 0.9,
               depth: 5.0,
               material: 'Hardcove, glossy paper',
               category_id: 1)
  Book.create!(name: 'Android Programming for Beginners',
               description: 'Smashing Book 5: Real-Life Responsive Web Design is our brand new.',
               year: 2016,
               price: 28.50,
               heigth: 6.4,
               width: 0.9,
               depth: 5.0,
               material: 'Hardcove, glossy paper',
               category_id: 1)
  Book.create!(name: 'Android Programming for Beginners',
               description: 'Smashing Book 5: Real-Life Responsive Web Design is our brand new.',
               year: 2016,
               price: 28.50,
               heigth: 6.4,
               width: 0.9,
               depth: 5.0,
               material: 'Hardcove, glossy paper',
               category_id: 1)
end

if BookAuthor.count.zero?
  BookAuthor.create!(book_id: 1, author_id: 1)

  BookAuthor.create!(book_id: 2, author_id: 1)

  BookAuthor.create!(book_id: 3, author_id: 1)

  BookAuthor.create!(book_id: 4, author_id: 2)

  BookAuthor.create!(book_id: 5, author_id: 2)
  BookAuthor.create!(book_id: 5, author_id: 3)
  BookAuthor.create!(book_id: 5, author_id: 4)

  BookAuthor.create!(book_id: 6, author_id: 2)

  BookAuthor.create!(book_id: 7, author_id: 2)
end
