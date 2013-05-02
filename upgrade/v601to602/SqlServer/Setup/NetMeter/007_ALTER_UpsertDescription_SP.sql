use %%NETMETER%%

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT

IF  EXISTS (SELECT * FROM sys.procedures WHERE object_id = OBJECT_ID(N'UpsertDescription') AND type in (N'P'))
	DROP PROCEDURE UpsertDescription
GO

create proc UpsertDescription
			@id_lang_code int,
			@a_nm_desc NVARCHAR(255),
			@a_id_desc_in int, 
			@a_id_desc int OUTPUT
		AS
		begin
      declare @var int
			IF (@a_id_desc_in IS NOT NULL and @a_id_desc_in <> 0)
				BEGIN
					-- there was a previous entry
				UPDATE t_description
					SET
						tx_desc = ltrim(rtrim(@a_nm_desc))
					WHERE
						id_desc = @a_id_desc_in AND id_lang_code = @id_lang_code

					IF (@@RowCount=0)
					BEGIN
					  -- The entry didn't previously exist for this language code
						INSERT INTO t_description
							(id_desc, id_lang_code, tx_desc)
						VALUES
							(@a_id_desc_in, @id_lang_code, ltrim(rtrim(@a_nm_desc)))
					END

					-- continue to use old ID
					select @a_id_desc = @a_id_desc_in
				END

			ELSE
			  begin
				-- there was no previous entry
				IF (@a_nm_desc IS NULL)
				 begin
					-- no new entry
					select @a_id_desc = 0
				 end
				 ELSE
					BEGIN
						-- generate a new ID to use
						INSERT INTO t_mt_id default values
						select @a_id_desc = @@identity

						INSERT INTO t_description
							(id_desc, id_lang_code, tx_desc)
						VALUES
							(@a_id_desc, @id_lang_code, ltrim(rtrim(@a_nm_desc)))
					 END
			END 
			end
			
GO