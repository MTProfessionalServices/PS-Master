SELECT * FROM (
            select distinct "_ACCOUNTID", "NAME_SPACE", "USERNAME" %%SORT_COLUMN%% %%FILTER_COLUMN%%
           from (%%INNER_QUERY%%) iq1) iq2 WHERE ("_ACCOUNTID") IN (%%ACCOUNTIDLIST%%)