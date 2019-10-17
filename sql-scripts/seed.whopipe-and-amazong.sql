BEGIN;

    INSERT INTO whopipe_video_views
        (region, date_viewed, video_name)
    VALUES
        (
            'Northeast', '2016-01-16 12:00:00', 'Despotato'),
        ('Midwest ', '2016-05-01 15:00:00', 'Shape of Pooh'),
        ('South', '2017-02-22 12:00:00', 'UpTown Monk'),
        ('West', '2017-04-04 08:00:00', 'Despotato'),
        ('Midwest ', '2017-04-23 15:00:00', 'Despotato'),
        ('Northeast', '2017-08-11 13:00:00', 'Cats that teach SQL'),
        ('Midwest ', '2017-12-09 17:00:00', 'Despotato'),
        ('South', '2018-01-24 19:00:00', 'Cats that teach SQL'),
        ('West', '2018-01-29 11:00:00', 'Man''s not torrid'),
        ('Northeast', '2018-02-13 05:00:00', 'UpTown Monk'),
        ('Midwest ', '2018-03-13 09:00:00', 'Shape of Pooh'),
        ('South', '2018-03-31 13:00:00', 'UpTown Monk'),
        ('Northeast', '2019-04-03 07:00:00', 'Despotato'),
        ('West', '2019-05-05 21:00:00', 'UpTown Monk'),
        ('West', now() - '29 days'
    ::INTERVAL, 'Man''s not torrid'),
    ('Northeast', now
    () - '29 days'::INTERVAL, 'Despotato'),
    ('Midwest ',  now
    () - '29 days'::INTERVAL, 'Cats that teach SQL'),
    ('Northeast', now
    () - '29 days'::INTERVAL, 'UpTown Monk'),
    ('Midwest ',  now
    () - '29 days'::INTERVAL, 'Despotato'),
    ('West',      now
    () - '29 days'::INTERVAL, 'Shape of Pooh'),
    ('Midwest ',  now
    () - '28 days'::INTERVAL, 'Cats that teach SQL'),
    ('Northeast', now
    () - '28 days'::INTERVAL, 'UpTown Monk'),
    ('Midwest ',  now
    () - '28 days'::INTERVAL, 'Man''s not torrid'),
    ('South',     now
    () - '28 days'::INTERVAL, 'Despotato'),
    ('West',      now
    () - '28 days'::INTERVAL, 'UpTown Monk'),
    ('Northeast', now
    () - '28 days'::INTERVAL, 'UpTown Monk'),
    ('Midwest ',  now
    () - '26 days'::INTERVAL, 'Man''s not torrid'),
    ('South',     now
    () - '22 days'::INTERVAL, 'Cats that teach SQL'),
    ('West ',     now
    () - '20 days'::INTERVAL, 'Despotato'),
    ('Northeast', now
    () - '20 days'::INTERVAL, 'Shape of Pooh'),
    ('Midwest ',  now
    () - '19 days'::INTERVAL, 'Despotato'),
    ('West',      now
    () - '13 days'::INTERVAL, 'Man''s not torrid'),
    ('West ',     now
    () - '12 days'::INTERVAL, 'Man''s not torrid'),
    ('Midwest ',  now
    () - '12 days'::INTERVAL, 'Man''s not torrid'),
    ('West',      now
    () - '12 days'::INTERVAL, 'Man''s not torrid'),
    ('Midwest ',  now
    () - '5 days'::INTERVAL,  'Cats that teach SQL'),
    ('Northeast', now
    () - '3 days'::INTERVAL,  'Cats that teach SQL'),
    ('South',     now
    () - '3 days'::INTERVAL,  'Despotato'),
    ('South',     now
    () - '3 days'::INTERVAL,  'Man''s not torrid'),
    ('South',     now
    () - '2 days'::INTERVAL,  'Man''s not torrid'),
    ('Northeast', now
    () - '10 hours'::INTERVAL, 'Shape of Pooh');

    INSERT INTO amazong_products
        (name, price, category, image)
    VALUES
        ('Flobulator 2000', 12.00, 'Electronics', null),
        ('Drip-catching coffee mug', 20.99, 'Homeware', null),
        ('Key to time', 400.00, 'DIY', 'https://time-itself.com/key.jpg'),
        ('Hoverboard', 53.20, 'Transport', 'https://marty-grooves.edu/board.png'),
        ('Social media androids', 399.00, 'Furniture', 'https://be-right-back.black/Ash_Starmer.jpg'),
        ('Infinite improbability drive', 0.01, 'Furniture', null),
        ('Self-drying jacket', 23.00, 'Clothing', null),
        ('Towel', 11.60, 'Homeware', 'https://safety-first.guide/towell.jpg'),
        ('Germ hunter', 27.00, 'Cleaning', null),
        ('Nutrimatic drinks dispenser', 65.00, 'Electronics', null),
        ('Double decker couch', 160.00, 'Furniture', null),
        ('One-size fits all shoes', 53.00, 'Clothing', null),
        ('Z-Eye', 31.00, 'Stationery', null),
        ('Sonic screwdriver', 77.00, 'Cleaning', null),
        ('Autonomous drone insect', 3.00, 'Electronics', 'https://gov.uk/surveillance.jpg'),
        ('Holographic wrestling game', 19.99, 'Games', null),
        ('Holophonor', 80.00, 'Cleaning', null),
        ('Arkangel', 200.00, 'Electronics', 'https://chips-and-tablets.tech/arkangel.webp'),
        ('Rebreather', 24.95, 'Clothing', null),
        ('Crisis inducer', 53.00, 'Games', 'https://toys-r-us.douglas/thanks-for-the-fish.png'),
        ('Light cycle', 2850.00, 'Transport', null),
        ('Replicator', 230.04, 'Grocery', 'https://scotty-kitchen-units.trekky/replicator.jpg'),
        ('Skin-Healing patch', 14.00, 'DIY', null),
        ('Safety foam', 34.00, 'Transport', null),
        ('Cookie', 299.99, 'Homeware', 'https://christmas.homesense/cookie.webp'),
        ('Tricorder', 75.00, 'Electronics', 'https://federation-essentials.trekky/tricorder.jpg'),
        ('Psychic paper', 90.00, 'DIY', null),
        ('Point of view gun', 145.20, 'Games', null),
        ('Unobtainium', 50.00, 'Homeware', null),
        ('Lightsaber', 34.50, 'DIY', 'https://starwars.jedi/zwoom.gif'),
        ('Neuralizer', 42.00, 'Cleaning', null),
        ('Everlasting gobstopper', 1.00, 'Grocery', null),
        ('Grain', 665.99, 'Electronics', null);

    COMMIT;
