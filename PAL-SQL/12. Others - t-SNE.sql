SET SCHEMA DM_PAL; 
DROP TABLE PAL_TSNE_DATA_TBL;
CREATE COLUMN TABLE PAL_TSNE_DATA_TBL ( 
	"ID" INTEGER,
	"ATT1" DOUBLE, 
	"ATT2" DOUBLE, 
	"ATT3" DOUBLE,
	"ATT4" DOUBLE,
	"ATT5" DOUBLE
);
INSERT INTO PAL_TSNE_DATA_TBL VALUES(1,1.0,2.0,-10.0,-20.0,3.0);
INSERT INTO PAL_TSNE_DATA_TBL VALUES(2,4.0,5.0,-30.0,-10.0,6.0);
INSERT INTO PAL_TSNE_DATA_TBL VALUES(3,7.0,8.0,-40.0,-50.0,9.0);
INSERT INTO PAL_TSNE_DATA_TBL VALUES(4,10.0,11.0,-25.0,-15.0,12.0);
INSERT INTO PAL_TSNE_DATA_TBL VALUES(5,13.0,14.0,-12.0,-24.0,15.0);
INSERT INTO PAL_TSNE_DATA_TBL VALUES(6,16.0,17.0,-9.0,-13.0,18.0);

DROP TABLE #PAL_PARAMETER_TBL;
CREATE LOCAL TEMPORARY COLUMN TABLE #PAL_PARAMETER_TBL (
	"PARAM_NAME" VARCHAR (100), 
	"INT_VALUE" INTEGER, 
	"DOUBLE_VALUE" DOUBLE, 
	"STRING_VALUE" VARCHAR (100)
);
INSERT INTO #PAL_PARAMETER_TBL VALUES('PERPLEXITY',  NULL, 1.0,  NULL);
INSERT INTO #PAL_PARAMETER_TBL VALUES('MAX_ITER', 600, NULL,  NULL);
INSERT INTO #PAL_PARAMETER_TBL VALUES('NO_DIM', 3, NULL,  NULL);
INSERT INTO #PAL_PARAMETER_TBL VALUES('THETA',  NULL, 0.5,  NULL);
INSERT INTO #PAL_PARAMETER_TBL VALUES('OBJ_FREQ', 100, NULL,  NULL);
INSERT INTO #PAL_PARAMETER_TBL VALUES('SEED', 30, NULL,  NULL);
INSERT INTO #PAL_PARAMETER_TBL VALUES('EXCLUDED_FEATURE', NULL, NULL, 'ATT3');
INSERT INTO #PAL_PARAMETER_TBL VALUES('EXCLUDED_FEATURE', NULL, NULL, 'ATT4');

CALL _SYS_AFL.PAL_TSNE(PAL_TSNE_DATA_TBL, #PAL_PARAMETER_TBL, ?, ?, ?);
