-- Constraint 1
-- The default actor name is 'Adam Sandler'.
ALTER TABLE Actor
MODIFY Name DEFAULT 'Adam Sandler';
--
-- Constraint 2
-- The score for a movie must be a value between 0 and 10.
ALTER TABLE Movie
ADD CONSTRAINT check_score CHECK (
        Score BETWEEN 0 and 10
    );
--
-- Constraint 3
-- After you successfully set up the score constraint, first
-- you then disable the constraint; second you enable the constraint.
-- Disable Constraint 2
ALTER TABLE Movie DISABLE CONSTRAINT check_score;
-- Enable Constraint 2
ALTER TABLE Movie ENABLE CONSTRAINT check_score;