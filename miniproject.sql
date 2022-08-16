-- Create a 'videos' table
CREATE TABLE videos (
	video_id SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	movie_length INT NOT NULL,
	url VARCHAR(255) UNIQUE NOT NULL
);

-- Insert data into 'videos' table
INSERT INTO videos (title, movie_length, url)
VALUES ('SQL Tutorial - Full Database Course for Beginners', 252, 'https://www.youtube.com/results?search_query=SQL' );

INSERT INTO videos (title, movie_length, url)
VALUES ('Map of Computer Science', 11, 'https://www.youtube.com/watch?v=SzJ46YA_RaA&ab_channel=DomainofScience' );

INSERT INTO videos (title, movie_length, url)
VALUES ('Machine Learning in 5 Levels of Difficulty', 11, 'https://www.youtube.com/watch?v=5q87K1WaoFI&ab_channel=WIRED' );

-- Update a row that had wrong movie_length
UPDATE videos
SET movie_length = 27
WHERE video_id = 6;

-- Create 'reviewers' table
CREATE TABLE reviewers (
	video_id INT REFERENCES videos(video_id),
	name VARCHAR(50) NOT NULL,
	rating INT,
	description VARCHAR(50)
);

-- Create 2 reviews per video
INSERT INTO reviewers (video_id, name, rating, description)
VALUES (1, 'John Smith', 5, 'Detailed, exciting');

INSERT INTO reviewers (video_id, name, rating, description)
VALUES (1, 'Albert Miff', 2, 'Too long');

INSERT INTO reviewers (video_id, name, rating, description)
VALUES (5, 'Johhny Cash', 1, 'Not music');

INSERT INTO reviewers (video_id, name, rating, description)
VALUES (5, 'Kevin James', 4, 'Kinda cool');

INSERT INTO reviewers (video_id, name, rating, description)
VALUES (6, 'Mark Lopez', 3, 'Wait, what?');

INSERT INTO reviewers (video_id, name, rating, description)
VALUES (6, 'Mark O', 4, 'Still confused');

-- Some queries. One to show reviewers and another to show reviews for each video.
SELECT * FROM reviewers;

SELECT * FROM videos
JOIN reviewers
ON videos.video_id = reviewers.video_id;
