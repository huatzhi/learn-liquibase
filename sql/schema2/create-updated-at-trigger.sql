CREATE TRIGGER update_order_items_updated_at
    BEFORE UPDATE ON schema2.order_items
    FOR EACH ROW
    EXECUTE FUNCTION schema2.update_updated_at();