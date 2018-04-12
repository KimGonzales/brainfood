users_list = [
    {username: 'kim', email: 'kim@kim.com', password: '123456'},
    {username: 'jess', email: 'jess@jess.com', password: '123456'},
    {username: 'skip', email: 'skip@skip.com', password: '123456'},
    {username: 'randi', email: 'randi@randi.com', password: '123456'}
]

users_list.each {|detail| new_user = User.create(detail)}


shelves_list = [
    {name: 'Travel', user_id: 1},
    {name: 'Feminist History', user_id: 4},
    {name: 'Clean Eating', user_id: 2},
    {name: "Man's Best Friend", user_id: 3},
    {name: 'Brain Development', user_id: 1},
    {name: 'Psychology', user_id: 2}
]

shelves_list.each {|deets| new_shelf = Shelf.create(deets)}

book_list =[
    {title: 'The Brain that Changes Itself', author: 'Norman Doidge', quote: 'We must be learning if we are to feel fully alive, and when life, or love, becomes too predictable and it seems like there is little left to learn, we become restless - a protest, perhaps, of the plastic brain when it can no longer perform its essential task.', shelf_id: 5},
    {title: 'Heart Berries', author: 'Terese Marie Mailhot', quote: "Nothing is too ugly for this world, I think. It's just that people pretend not to see.", shelf_id: 2},
    {title: 'Dog Training for Dummies', author: 'Jack Volhard', quote: "Let's face it. Puppies can make anyone melt.", shelf_id: 4},
    {title: 'The Man Who Mitook His Wife for a Hat', author: 'Oliver Sacks', quote: 'If a man has lost a leg or an eye, he knows he has lost a leg or an eye; but if he has lost a self—himself—he cannot know it, because he is no longer there to know it.', shelf_id: 5},
    {title: 'I Quit Sugar Cookbook', author: 'Sarah Wilson', quote: 'I write to spark my lazy soul', shelf_id: 3},
    {title: 'Southeast Asia on a Shoestring', author: 'China Williams', quote: "One Week Get tussled about by Bangkok's chaos, then cruise up to Sukhothai to tour the quiet old ruins. Continue north to Chiang Mai, an easygoing cultural city. Climb up the mountain range to Pai for mountain scenery and bluesy late-nighters.", shelf_id: 1},
    {title: 'Eat, Pray, Love', author: 'Elizabeth Gilbert', quote: 'You are, after all, what you think. Your emotions are the slaves to your thoughts, and you are the slave to your emotions.', shelf_id: 1},
    {title: 'Thinking Fast and Slow', author: 'Daniel Kahneman', quote: 'Nothing in life is as important as you think it is, while you are thinking about it.', shelf_id: 6}
]

book_list.each {|detail| new_book = Book.create(detail)}