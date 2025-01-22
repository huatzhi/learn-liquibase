CREATE OR REPLACE FUNCTION schema2.update_updated_at()
RETURNS TRIGGER AS $function$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$function$ language 'plpgsql';