-----------------------------------------------------------

1. Find the 5 oldest users:

SELECT username
FROM users
ORDER BY created_at
LIMIT 5;

-----------------------------------------------------------

2. What day of the week do most users register on?

SELECT 
    DAYNAME(created_at) as day,
    COUNT(*) as count
FROM users
GROUP BY
    day
ORDER BY
    count DESC
LIMIT 5;

-----------------------------------------------------------

3. Find the users who have never posted a photo

SELECT 
    username,
    COUNT(photos.id) as count
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
GROUP BY
    username
HAVING
    count = 0;

-----------------------------------------------------------

4. Most likes on a single photo?

SELECT
    username,
    photo_id,
    image_url,
    COUNT(*) AS total
FROM likes
JOIN photos 
    ON likes.photo_id = photos.id
JOIN users
    ON photos.user_id = users.id
GROUP BY
    photo_id
ORDER BY
    total DESC
LIMIT 1;

-----------------------------------------------------------

5. How many times does the average user post?

SELECT 
    user_id,
    COUNT(*) as count,
    AVG(COUNT(*)) OVER()
FROM photos
GROUP BY
    user_id;

SELECT
    COUNT(*) / COUNT(DISTINCT user_id)
FROM photos;

The above queries only takes into account people that HAVE posted not all users

SELECT
    COUNT(image_url) / COUNT(DISTINCT username)
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id; 

SELECT
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users);

-----------------------------------------------------------

6. What are the top 5 most commonly used hashtags?

SELECT
    tag_name,
    tag_id,
    COUNT(*) AS count
FROM photo_tags
LEFT JOIN tags
    ON photo_tags.tag_id = tags.id
GROUP BY
    tag_id
ORDER BY
    count DESC
LIMIT 7;

-----------------------------------------------------------

7. Find users who have liked every single photo on the site.

SELECT 
    username,
    COUNT(*) as total
FROM likes
JOIN users
    ON likes.user_id = users.id
GROUP BY
    user_id
HAVING 
    total = (SELECT COUNT(*) FROM photos);
