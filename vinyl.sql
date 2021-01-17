CREATE TABLE artist (
  id BIGSERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	members TEXT ARRAY NOT NULL,
	photo TEXT NOT NULL,
	year_formed INT NOT NULL,
	place_of_origin VARCHAR(100) NOT NULL,
	favourite BOOLEAN DEFAULT FALSE NOT NULL
);

INSERT INTO artist (name, members, photo, year_formed, place_of_origin, favourite) VALUES (
  'Arctic Monkeys', ARRAY ['Alex Turner', 'Matt Helders', 'Jamie Cook', 'Nick O''Maley'], 'https://www.nme.com/wp-content/uploads/2017/09/2012ArcticMonkeys02DC011211-696x442.jpg', 2002, 'Sheffield, England', TRUE
);
INSERT INTO artist (name, members, photo, year_formed, place_of_origin) VALUES (
  'Royal Blood', ARRAY ['Mike Kerr', 'Ben Thatcher'], 'https://www.nme.com/wp-content/uploads/2020/06/Royal-Blood.jpg', 2011, 'Brighton, England'
);
INSERT INTO artist (name, members, photo, year_formed, place_of_origin, favourite) VALUES (
  'Tame Impala', ARRAY ['Kevin Parker'], 'https://pyxis.nymag.com/v1/imgs/3da/7b1/680c3db824fef93b5293eef6687b4f05db-19-tama-impala-opener.2x.rsocial.w600.jpg', 2007, 'Perth, Australia', TRUE
);
INSERT INTO artist (name, members, photo, year_formed, place_of_origin) VALUES (
  'The Black Keys', ARRAY ['Dan Auerbach', 'Patrick Carney'], 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPUY7WQKSBLq-KUJ8YP52DbYNr-ME2V5KCIg&usqp=CAU', 2001, 'Akron, Ohio, United States'
);
INSERT INTO artist (name, members, photo, year_formed, place_of_origin) VALUES (
  'Idles', ARRAY ['Joe Talbot', 'Adam Devonshire', 'Mark Bowen', 'Lee Kiernan', 'Jon Beavis'], 'https://diy-magazine.s3.amazonaws.com/d/diy/Artists/I/IDLES/DIY-77/IDLES-DIY-77-Pooneh-Ghana-50005-web_180730_173917.jpg', 2009, 'Bristol, England'
);
INSERT INTO artist (name, members, photo, year_formed, place_of_origin) VALUES (
  'The Beatles', ARRAY ['John Lennon', 'Paul McCartney', 'George Harrison', 'Ringo Starr'], 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyqQ1WEH5-rGLsNifs8X6DWEeepjntD3qF8Q&usqp=CAU', 1960, 'Liverpool, England'
);
INSERT INTO artist (name, members, photo, year_formed, place_of_origin, favourite) VALUES (
  'Led Zeppelin', ARRAY ['Jimmy Page', 'Robert Plant', 'John Bonham', 'John Paul Jones'], 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOndrApJiC50AA5bCp0WuRLqYCEuE9KVhTAQ&usqp=CAU', 1968, 'London, England', TRUE
);
INSERT INTO artist (name, members, photo, year_formed, place_of_origin, favourite) VALUES (
  'The Who', ARRAY ['Roger Daltrey', 'Pete Townshend', 'Keith Moon', 'John Entwistle'], 'https://alldylan.com/wp-content/uploads/2013/05/The+Who.jpg', 1964, 'London, England', TRUE
);
INSERT INTO artist (name, members, photo, year_formed, place_of_origin) VALUES (
  'Pink Floyd', ARRAY ['Roger Waters', 'David Gilmour', 'Nick Mason', 'Richard Wright', 'Syd Barrett', 'Bob Klose'], 'https://i.guim.co.uk/img/static/sys-images/Books/Pix/pictures/2013/4/9/1365506317084/Pink-Floyd-publicity-shot-007.jpg?width=300&quality=45&auto=format&fit=max&dpr=2&s=9bd2ca647fbf450dfa8dc9ecf2dee559', 1965, 'London, England'
);
INSERT INTO artist (name, members, photo, year_formed, place_of_origin) VALUES (
  'The Jimi Hendrix Experience', ARRAY ['Jimi Hendrix', 'Mitch Mitchell', 'Noel Redding'], 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC3dHmvsea2gtv5uz74F9b5YiNg4anMbzUqA&usqp=CAU', 1966, 'London, England'
);


CREATE TABLE album (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  artist_id BIGINT REFERENCES artist NOT NULL,
	title VARCHAR(255) NOT NULL,
	image TEXT NOT NULL,
	price NUMERIC(12, 2) NOT NULL,
  label VARCHAR(100) NOT NULL,
	release_date DATE NOT NULL,
	tracklist TEXT ARRAY NOT NULL,
  recommended BOOLEAN DEFAULT FALSE NOT NULL
);

INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  1, 'Whatever People Say I Am, That''s What I''m Not', 'https://upload.wikimedia.org/wikipedia/en/5/5f/Whatever_People_Say_I_Am%2C_That%27s_What_I%27m_Not.jpg', 19.99, 'Domino', '23/01/2006', ARRAY ['The View from the Afternoon', 'I Bet You Look Good on the Dancefloor', 'Fake Tales of San Francisco', 'Dancing Shoes', 'You Probably Couldn''t See for the Lights but You Were Staring Straight at Me', 'Still Take You Home', 'Riot Van', 'Red Light Indicates Doors Are Secured', 'Mardy Bum', 'Perhaps Vampires Is a Bit Strong But...', 'When the Sun Goes Down', 'From the Ritz to the Rubble', 'A Certain Romance']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist, recommended) VALUES (
  1, 'Favourite Worst Nightmare', 'https://upload.wikimedia.org/wikipedia/en/a/ae/Favourite_Worst_Nightmare.jpg', 19.99, 'Domino', '23/04/2007', ARRAY ['Brianstorm', 'Teddy Picker', 'D is for Dangerous', 'Balaclava', 'Flourescent Adolescent', 'Only Ones Who Know', 'Do Me a Favour', 'This House is a Circus', 'If You Were There Beware', 'Do the Bad Thing', 'Old Yellow Bricks', '505'], TRUE
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  1, 'Humbug', 'https://upload.wikimedia.org/wikipedia/en/2/20/Arcticmonkeys-humbug.jpg', 19.99, 'Domino', '19/08/2009', ARRAY [	'My Propeller', 'Crying Lightning', 'Dangerous Animals', 'Secret Door', 'Potion Approaching', 'Fire and the Thud', 'Cornerstone', 'Dance Little Liar', 'Pretty Visitors', 'The Jeweller''s Hands']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  1, 'Suck It and See', 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Suckitandsee.jpg', 19.99, 'Domino', '06/06/2011', ARRAY ['She''s Thunderstorms', 'Black Treacle', 'Brick by Brick', 'The Hellcat Spangled Shalalala', 'Don''t Sit Down ''Cause I''ve Moved Your Chair', 'Library Pictures', 'All My Own Stunts', 'Reckless Serenade', 'Piledriver Waltz', 'Love Is a Laserquest', 'Suck It and See', 'That''s Where You''re Wrong']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  1, 'AM', 'https://upload.wikimedia.org/wikipedia/en/0/04/Arctic_Monkeys_-_AM.png', 19.99, 'Domino', '09/09/2013', ARRAY ['Do I Wanna Know?', 'R U Mine?', 'One for the Road', 'Arabella', 'I Want It All', 'No.1 Party Anthem', 'Mad Sounds', 'Fireside', 'Why''d You Only Call Me When You''re High?', 'Snap Out of It', 'Knee Socks', 'I Wanna Be Yours']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  1, 'Tranquility Base Hotel & Casino', 'https://upload.wikimedia.org/wikipedia/en/3/38/Arctic_Monkeys_%E2%80%93_Tranquility_Base_Hotel_%26_Casino.png', 19.99, 'Domino', '11/05/2018', ARRAY [	'Star Treatment', 'One Point Perspective', 'American Sports', 'Tranquility Base Hotel & Casino', 'Golden Trunks', 'Four Out of Five', 'The World''s First Ever Monster Truck Front Flip', 'Science Fiction', 'She Looks Like Fun', 'Batphone', 'The Ultracheese']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist, recommended) VALUES (
  2, 'Royal Blood', 'https://upload.wikimedia.org/wikipedia/en/b/b0/Royal_Blood_-_Royal_Blood_%28Artwork%29.jpg', 14.99, 'Warner Bros.', '25/08/2014', ARRAY [	'Out of the Black', 'Come On Over', 'Figure It Out', 'You Can Be So Cruel', 'Blood Hands', 'Little Monster', 'Loose Change', 'Careless', 'Ten Tonne Skeleton', 'Better Strangers'], TRUE
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  2, 'How Did We Get So Dark?', 'https://upload.wikimedia.org/wikipedia/en/b/ba/Royal-Blood-How-Did-We-Get-So-Dark.jpg', 14.99, 'Warner Bros.', '16/06/2017', ARRAY [	'How Did We Get So Dark?', 'Lights Out', 'I Only Lie When I Love You', 'She''s Creeping', 'Look Like You Know', 'Where Are You Now?', 'Don''t Tell', 'Hook, Line & Sinker', 'Hole in Your Heart', 'Sleep']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  3, 'Innerspeaker', 'https://upload.wikimedia.org/wikipedia/en/d/dc/Tame_Impala_-_Innerspeaker.png', 24.99, 'Modular', '21/05/2010', ARRAY [	'It Is Not Meant to Be', 'Desire Be Desire Go', 'Alter Ego', 'Lucidity', 'Why Won''t You Make Up Your Mind?', 'Solitude Is Bliss', 'Jeremy''s Storm', 'Expectation', 'The Bold Arrow of Time', 'Runway, Houses, City, Clouds', 'I Don''t Really Mind']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist, recommended) VALUES (
  3, 'Lonerism', 'https://upload.wikimedia.org/wikipedia/en/3/31/Tame_Impala_-_Lonerism.png', 24.99, 'Modular', '05/10/2012', ARRAY ['Be Above It', 'Endors Toi', 'Apocalypse Dreams', 'Mind Mischief', 'Music to Walk Home By', 'Why Won''t They Talk to Me?', 'Feels Like We Only Go Backwards', 'Keep on Lying', 'Elephant', 'She Just Won''t Believe Me', 'Nothing That Has Happened So Far Has Been Anything We Could Control', 'Sun''s Coming Up'], TRUE
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  3, 'Currents', 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png', 24.99, 'Modular', '17/07/2015', ARRAY ['Let It Happen', 'Nangs', 'The Moment', 'Yes I''m Changing', 'Eventually', 'Gossip', 'The Less I Know the Better', 'Past Life', 'Disciples', '''Cause I''m a Man', 'Reality in Motion', 'Love/Paranoia', 'New Person, Same Old Mistakes']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  3, 'The Slow Rush', 'https://upload.wikimedia.org/wikipedia/en/5/54/Tame_Impala_-_The_Slow_Rush.png', 24.99, 'Modular', '14/02/2020', ARRAY ['One More Year', 'Instant Destiny', 'Borderline', 'Posthumous Forgiveness', 'Breathe Deeper', 'Tomorrow''s Dust', 'On Track', 'Lost in Yesterday', 'Is It True', 'It Might Be Time', 'Glimmer', 'One More Hour']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist, recommended) VALUES (
  4, 'Thickfreakness', 'https://upload.wikimedia.org/wikipedia/en/1/1e/The_Black_Keys_-_Thickfreakness.jpg', 14.99, 'Fat Possum', '08/04/2003', ARRAY ['Thickfreakness', 'Hard Row', 'Set You Free', 'Midnight in Her Eyes', 'Have Love Will Travel', 'Hurt Like Mine', 'Everywhere I Go', 'No Trust', 'If You See Me', 'Hold Me in Your Arms', 'I Cry Alone'], TRUE
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  4, 'Rubber Factory', 'https://upload.wikimedia.org/wikipedia/en/a/ae/The_Black_Keys_-_Rubber_Factory.jpg', 19.99, 'Fat Possum', '07/09/2004', ARRAY ['When the Lights Go Out', '10 A.M. Automatic', 'Just Couldn''t Tie Me Down', 'All Hands Against His Own', 'The Desperate Man', 'Girl Is on My Mind', 'The Lengths', 'Grown So Ugly', 'Stack Shot Billy', 'Act Nice and Gentle', 'Aeroplane Blues', 'Keep Me', 'Till I Get My Way']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  4, 'Brothers', 'https://upload.wikimedia.org/wikipedia/en/9/93/The_Black_Keys_-_Brothers.jpg', 24.99, 'Nonesuch', '18/05/2010', ARRAY ['Everlasting Light', 'Next Girl', 'Tighten Up', 'Howlin'' for You', 'She''s Long Gone', 'Black Mud', 'The Only One', 'Too Afraid to Love You', 'Ten Cent Pistol', 'Sinister Kid', 'The Go Getter', 'I''m Not the One', 'Unknown Brother', 'Never Give You Up', 'These Days']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  4, 'El Camino', 'https://upload.wikimedia.org/wikipedia/en/9/92/The_Black_Keys_El_Camino_Album_Cover.jpg', 24.99, 'Nonesuch', '06/12/2011', ARRAY ['Lonely Boy', 'Dead and Gone', 'Gold on the Ceiling', 'Little Black Submarines', 'Money Maker', 'Run Right Back', 'Sister', 'Hell of a Season', 'Stop Stop', 'Nova Baby', 'Mind Eraser']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  4, 'Turn Blue', 'https://upload.wikimedia.org/wikipedia/en/b/bb/Black_Keys_Turn_Blue_album_cover.png', 29.99, 'Nonesuch', '12/05/2014', ARRAY ['Weight of Love', 'In Time', 'Turn Blue', 'Fever', 'Year in Review', 'Bullet in the Brain', 'It''s Up to You Now', 'Waiting on Words', '10 Lovers', 'In Our Prime', 'Gotta Get Away']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  5, 'Brutalism', 'https://upload.wikimedia.org/wikipedia/en/3/3c/Idles-Brutalism.jpg', 14.99, 'Partisan', '10/03/2017', ARRAY ['Heel/Heal', 'Well Done', 'Mother', 'Date Night', 'Faith in the City', '1049 Gotho', 'Divide & Conquer', 'Rachel Khoo', 'Stendhal Syndrome', 'Exeter', 'Benzocaine', 'White Privilege', 'Slow Savage']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  5, 'Joy as an Act of Resistance', 'https://upload.wikimedia.org/wikipedia/en/e/e4/Idles-Joy_as_an_Act_of_Resistance.jpg', 19.99, 'Partisan', '31/08/2018', ARRAY ['Colossus', 'Never Fight a Man with a Perm', 'I''m Scum', 'Danny Nedelko', 'Love Song', 'June', 'Samaritans', 'Television', 'Great', 'Gram Rock', 'Cry to Me', 'Rottweiler']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  5, 'Ultra Mono', 'https://upload.wikimedia.org/wikipedia/en/3/3c/Idles_Ultra_Mono_artwork.jpg', 19.99, 'Partisan', '25/09/2020', ARRAY ['War', 'Grounds', 'Mr. Motivator', 'Anxiety', 'Kill Them With Kindness', 'Model Village', 'Ne Touche Pas Moi', 'Carcinogenic', 'Reigns', 'The Lover', 'A Hymn', 'Danke']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  6, 'Rubber Soul', 'https://upload.wikimedia.org/wikipedia/en/7/74/Rubber_Soul.jpg', 24.99, 'Parlophone', '03/12/1965', ARRAY ['Drive My Car', 'Norwegian Wood (This Bird Has Flown)', 'You Won''t See Me', 'Nowhere Man', 'Think for Yourself', 'The Word', 'Michelle', 'What Goes On', 'Girl', 'I''m Looking Through You', 'In My Life', 'Wait', 'If I Needed Someone', 'Run for Your Life']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist, recommended) VALUES (
  6, 'Revolver', 'https://upload.wikimedia.org/wikipedia/en/1/16/Revolver.jpg', 24.99, 'Parlophone', '05/08/1966', ARRAY ['Taxman', 'Eleanor Rigby', 'I''m Only Sleeping', 'Love You To', 'Here, There and Everywhere', 'Yellow Submarine', 'She Said She Said', 'Good Day Sunshine', 'And Your Bird Can Sing', 'For No One', 'Doctor Robert', 'I Want to Tell You', 'Got to Get You into My Life', 'Tomorrow Never Knows'], TRUE
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  6, 'Sgt. Pepper''s Lonely Hearts Club Band', 'https://upload.wikimedia.org/wikipedia/en/5/50/Sgt._Pepper%27s_Lonely_Hearts_Club_Band.jpg', 24.99, 'Parlophone', '26/05/1967', ARRAY ['Sgt. Pepper''s Lonely Hearts Club Band', 'With a Little Help from My Friends', 'Lucy in the Sky with Diamonds', 'Getting Better', 'Fixing a Hole', 'She''s Leaving Home', 'Being for the Benefit of Mr. Kite!', 'Within You Without You', 'When I''m Sixty-Four', 'Lovely Rita', 'Good Morning Good Morning', 'Sgt. Pepper''s Lonely Hearts Club Band (Reprise)', 'A Day in the Life']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  6, 'The White Album', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/TheBeatles68LP.jpg/330px-TheBeatles68LP.jpg', 29.99, 'Apple', '22/11/1968', ARRAY ['Back in the U.S.S.R.', 'Dear Prudence', 'Glass Onion', 'Ob-La-Di, Ob-La-Da', 'Wild Honey Pie', 'The Continuing Story of Bungalow Bill', 'While My Guitar Gently Weeps', 'Happiness Is a Warm Gun', 'Martha My Dear', 'I''m So Tired', 'Blackbird', 'Piggies', 'Rocky Raccoon', 'Don''t Pass Me By', 'Why Don''t We Do It in the Road?', 'I Will', 'Julia', 'Birthday', 'Yer Blues', 'Mother Nature''s Son', 'Everybody''s Got Something to Hide Except Me and My Monkey', 'Sexy Sadie', 'Helter Skelter', 'Long, Long, Long', 'Revolution 1', 'Honey Pie', 'Savoy Truffle', 'Cry Baby Cry', 'Revolution 9', 'Good Night']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  6, 'Abbey Road', 'https://upload.wikimedia.org/wikipedia/en/4/42/Beatles_-_Abbey_Road.jpg', 24.99, 'Apple', '26/09/1969', ARRAY ['Come Together', 'Something', 'Maxwell''s Silver Hammer', 'Oh! Darling', 'Octopus''s Garden', 'I Want You (She''s So Heavy)', 'Here Comes the Sun', 'Because', 'You Never Give Me Your Money', 'Sun King', 'Mean Mr. Mustard', 'Polythene Pam', 'She Came In Through the Bathroom Window', 'Golden Slumbers', 'Carry That Weight', 'The End', 'Her Majesty']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist, recommended) VALUES (
  7, 'Led Zeppelin I', 'https://upload.wikimedia.org/wikipedia/en/e/ef/Led_Zeppelin_-_Led_Zeppelin_%281969%29_front_cover.png', 14.99, 'Atlantic', '12/01/1969', ARRAY ['Good Times Bad Times', 'Babe I''m Gonna Leave You', 'You Shook Me', 'Dazed and Confused', 'Your Time Is Gonna Come', 'Black Mountain Side', 'Communication Breakdown', 'I Can''t Quit You Baby', 'How Many More Times'], TRUE
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  7, 'Led Zeppelin II', 'https://upload.wikimedia.org/wikipedia/en/2/20/Led_Zeppelin_-_Led_Zeppelin_II.jpg', 14.99, 'Atlantic', '22/10/1969', ARRAY ['Whole Lotta Love', 'What Is and What Should Never Be', 'The Lemon Song', 'Thank You', 'Heartbreaker', 'Living Loving Maid (She''s Just a Woman)', 'Ramble On', 'Moby Dick', 'Bring It On Home']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  7, 'Led Zeppelin III', 'https://upload.wikimedia.org/wikipedia/en/5/5f/Led_Zeppelin_-_Led_Zeppelin_III.png', 24.99, 'Atlantic', '05/10/1970', ARRAY ['Immigrant Song', 'Friends', 'Celebration Day', 'Since I''ve Been Loving You', 'Out on the Tiles', 'Gallows Pole', 'Tangerine', 'That''s the Way', 'Bron-Y-Aur Stomp', 'Hats Off to (Roy) Harper']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  7, 'Led Zeppelin IV', 'https://upload.wikimedia.org/wikipedia/en/2/26/Led_Zeppelin_-_Led_Zeppelin_IV.jpg', 14.99, 'Atlantic', '08/11/1971', ARRAY ['Black Dog', 'Rock and Roll', 'The Battle of Evermore', 'Stairway to Heaven', 'Misty Mountain Hop', 'Four Sticks', 'Going to California', 'When the Levee Breaks']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  7, 'Houses of the Holy', 'https://upload.wikimedia.org/wikipedia/en/9/9f/Led_Zeppelin_-_Houses_of_the_Holy.jpg', 24.99, 'Atlantic', '29/03/1973', ARRAY ['The Song Remains the Same', 'The Rain Song', 'Over the Hills and Far Away', 'The Crunge', 'Dancing Days', 'D''yer Mak''er', 'No Quarter', 'The Ocean']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  7, 'Physical Graffiti', 'https://upload.wikimedia.org/wikipedia/en/e/e3/Led_Zeppelin_-_Physical_Graffiti.jpg', 29.99, 'Atlantic', '24/02/1975', ARRAY ['Custard Pie', 'The Rover', 'In My Time of Dying', 'Houses of the Holy', 'Trampled Under Foot', 'Kashmir', 'In the Light', 'Bron-Yr-Aur', 'Down by the Seaside', 'Ten Years Gone', 'Night Flight', 'The Wanton Song', 'Boogie with Stu', 'Black Country Woman', 'Sick Again']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  8, 'My Generation', 'https://upload.wikimedia.org/wikipedia/en/0/01/My-Generation--2.jpg', 29.99, 'Brunswick', '03/12/1965', ARRAY ['Out in the Street', 'I Don''t Mind', 'The Good''s Gone', 'La-La-La-Lies', 'Much Too Much', 'My Generation', 'The Kids Are Alright', 'Please, Please, Please', 'It''s Not True', 'I''m a Man', 'A Legal Matter', 'The Ox']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  8, 'The Who Sells Out', 'https://upload.wikimedia.org/wikipedia/en/9/98/The_who_sell_out_album_front.jpg', 19.99, 'Track', '15/12/1967', ARRAY ['Armenia City in the Sky', 'Heinz Baked Beans', 'Mary Anne with the Shaky Hand', 'Odorono', 'Tattoo', 'Our Love Was', 'I Can See for Miles', 'Can''t Reach You', 'Medac', 'Relax', 'Silas Stingy', 'Sunrise', 'Rael (1 and 2)']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  8, 'Tommy', 'https://upload.wikimedia.org/wikipedia/en/1/19/Tommyalbumcover.jpg', 24.99, 'Decca', '23/05/1969', ARRAY ['Overture', 'It''s a Boy', '1921', 'Amazing Journey', 'Sparks', 'The Hawker', 'Christmas', 'Cousin Kevin', 'The Acid Queen', 'Underture', 'Do You Think It''s Alright?', 'Fiddle About', 'Pinball Wizard', 'There''s a Doctor', 'Go to the Mirror!', 'Tommy Can You Hear Me?', 'Smash the Mirror', 'Sensation', 'Miracle Cure', 'Sally Simpson', 'I''m Free', 'Welcome', 'Tommy''s Holiday Camp', 'We''re Not Gonna Take It']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist, recommended) VALUES (
  8, 'Who''s Next', 'https://upload.wikimedia.org/wikipedia/en/4/44/Whosnext.jpg', 19.99, 'Track', '14/08/1971', ARRAY ['Baba O''Riley', 'Bargain', 'Love Ain''t for Keeping', 'My Wife', 'The Song Is Over', 'Getting in Tune', 'Going Mobile', 'Behind Blue Eyes', 'Won''t Get Fooled Again'], TRUE
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  8, 'Quadrophenia', 'https://upload.wikimedia.org/wikipedia/en/8/8a/Quadrophenia_%28album%29.jpg', 24.99, 'Decca', '26/10/1973', ARRAY ['I Am the Sea', 'The Real Me', 'Quadrophenia', 'Cut My Hair', 'The Punk and the Godfather', 'I''m One', 'The Dirty Jobs', 'Helpless Dancer', 'Is It in My Head?', 'I''ve Had Enough', '5:15', 'Sea and Sand', 'Drowned', 'Bell Boy', 'Doctor Jimmy', 'The Rock', 'Love, Reign o''er Me']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  9, 'Meddle', 'https://upload.wikimedia.org/wikipedia/en/d/d4/MeddleCover.jpeg', 24.99, 'Harvest', '31/10/1971', ARRAY ['One of These Days', 'A Pillow of Winds', 'Fearless', 'San Tropez', 'Seamus', 'Echoes']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist, recommended) VALUES (
  9, 'Dark Side of the Moon', 'https://upload.wikimedia.org/wikipedia/en/3/3b/Dark_Side_of_the_Moon.png', 19.99, 'Harvest', '01/03/1973', ARRAY ['Speak to Me', 'Breathe', 'On the Run', 'Time', 'The Great Gig in the Sky', 'Money', 'Us and Them', 'Any Colour You Like', 'Brain Damage', 'Eclipse'], TRUE
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  9, 'Wish You Were Here', 'https://upload.wikimedia.org/wikipedia/en/a/a4/Pink_Floyd%2C_Wish_You_Were_Here_%281975%29.png', 19.99, 'Harvest', '12/09/1975', ARRAY ['Shine On You Crazy Diamond (Parts I–V)', 'Welcome to the Machine', 'Have a Cigar', 'Wish You Were Here', 'Shine On You Crazy Diamond (Parts VI–IX)']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  9, 'Animals', 'https://upload.wikimedia.org/wikipedia/en/7/74/Pink_Floyd-Animals-Frontal.jpg', 19.99, 'Harvest', '21/01/1977', ARRAY ['Pigs on the Wing (Part 1)', 'Dogs', 'Pigs (Three Different Ones)', 'Sheep', 'Pigs on the Wing (Part 2)']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  9, 'The Wall', 'https://upload.wikimedia.org/wikipedia/en/1/13/PinkFloydWallCoverOriginalNoText.jpg', 24.99, 'Harvest', '30/11/1979', ARRAY ['In the Flesh?', 'The Thin Ice', 'Another Brick in the Wall, Part 1', 'The Happiest Days of Our Lives', 'Another Brick in the Wall, Part 2', 'Mother', 'Goodbye Blue Sky', 'Empty Spaces', 'Young Lust', 'One of My Turns', 'Don''t Leave Me Now', 'Another Brick in the Wall, Part 3', 'Goodbye Cruel World', 'Hey You', 'Is There Anybody Out There?', 'Nobody Home', 'Vera', 'Bring the Boys Back Home', 'Comfortably Numb', 'The Show Must Go On', 'In the Flesh', 'Run Like Hell', 'Waiting for the Worms', 'Stop', 'The Trial', 'Outside the Wall']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  10, 'Are You Experienced?', 'https://upload.wikimedia.org/wikipedia/en/1/17/AreyouexpUK.jpg', 24.99, 'Track', '12/05/1967', ARRAY ['Foxy Lady', 'Manic Depression', 'Red House', 'Can You See Me', 'Love or Confusion', 'I Don''t Live Today', 'May This Be Love', 'Fire', '3rd Stone from the Sun', 'Remember', 'Are You Experienced?']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  10, 'Axis: Bold as Love', 'https://upload.wikimedia.org/wikipedia/en/8/85/Axiscover.jpg', 24.99, 'Track', '01/12/1967', ARRAY ['EXP', 'Up from the Skies', 'Spanish Castle Magic', 'Wait Until Tomorrow', 'Ain''t No Telling', 'Little Wing', 'If Six Was Nine', 'You''ve Got Me Floating', 'Castles Made of Sand', 'She''s So Fine', 'One Rainy Wish', 'Little Miss Lover', 'Bold as Love']
);
INSERT INTO album (artist_id, title, image, price, label, release_date, tracklist) VALUES (
  10, 'Electric Ladyland', 'https://upload.wikimedia.org/wikipedia/en/f/f2/Jimi_Hendrix_-_Electric_Ladyland.jpg', 24.99, 'Reprise', '16/10/1968', ARRAY ['...And the Gods Made Love', 'Have You Ever Been (To Electric Ladyland)', 'Crosstown Traffic', 'Voodoo Chile', 'Little Miss Strange', 'Long Hot Summer Night', 'Come On', 'Gypsy Eyes', 'Burning of the Midnight Lamp', 'Rainy Day, Dream Away', '1983... (A Merman I Should Turn to Be)', 'Moon, Turn the Tides....Gently Gently Away', 'Still Raining, Still Dreaming', 'House Burning Down', 'All Along the Watchtower', 'Voodoo Child (Slight Return)']
);


































































