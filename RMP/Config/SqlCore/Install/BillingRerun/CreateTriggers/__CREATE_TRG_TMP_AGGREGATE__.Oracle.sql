CREATE OR REPLACE TRIGGER TRG_TMP_AGGREGATE
   BEFORE INSERT
   ON TTT_TMP_AGGREGATE
   FOR EACH ROW
BEGIN
   :NEW.tx_id := mt_ttt.g_tx_id;
END;
/