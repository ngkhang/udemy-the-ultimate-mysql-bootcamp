-- Preventing self-follows
DELIMITER $$ CREATE TRIGGER prevent_self_follow BEFORE
INSERT
    ON followers FOR EACH ROW;
BEGIN IF NEW.follower_id = NEW.followee THEN SIGNAL SQLSTATE '450000'
SET
    MESSAGE_TEXT = 'You cannot follow yourself';
END IF;
END;
$$ DELIMITER;


-- Logging Unfollows
DELIMITER $$ CREATE TRIGGER unfollow_log BEFORE DELETE ON followers FOR EACH ROW;
BEGIN
INSERT INTO
    unfollows (follower_id, followee)
VALUES
    (OLD.follower_id, OLD.followee)
END;
$$ DELIMITER;
