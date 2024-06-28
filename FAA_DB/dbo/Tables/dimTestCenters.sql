CREATE TABLE [dbo].[dimTestCenters] (
    [AtlasTestCenterID]     INT           NOT NULL,
    [GlobalTestCenterID]    VARCHAR (20)  NULL,
    [TestCenterDisplayName] VARCHAR (100) NULL,
    [TestCenterName]        VARCHAR (100) NULL,
    [Address1]              VARCHAR (50)  NULL,
    [Address2]              VARCHAR (50)  NULL,
    [City]                  VARCHAR (30)  NULL,
    [State]                 VARCHAR (30)  NULL,
    [Zip]                   VARCHAR (10)  NULL,
    [Country]               VARCHAR (100) NULL,
    [Timezone]              VARCHAR (255) NULL,
    CONSTRAINT [PKTestCenters] PRIMARY KEY CLUSTERED ([AtlasTestCenterID] ASC)
);

