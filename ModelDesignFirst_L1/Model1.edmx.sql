
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/14/2019 18:19:40
-- Generated from EDMX file: C:\Users\albodnar\source\repos\my-project\ModelDesignFirst_L1\ModelDesignFirst_L1\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [master];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Clienti'
CREATE TABLE [dbo].[Clienti] (
    [ClientId] int IDENTITY(1,1) NOT NULL,
    [Nume] nvarchar(max)  NOT NULL,
    [Prenume] nvarchar(max)  NOT NULL,
    [Adresa] nvarchar(max)  NOT NULL,
    [Localitate] nvarchar(max)  NOT NULL,
    [Judet] nvarchar(max)  NOT NULL,
    [Telefon] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Auto_AutoId] int  NOT NULL
);
GO

-- Creating table 'Autos'
CREATE TABLE [dbo].[Autos] (
    [AutoId] int IDENTITY(1,1) NOT NULL,
    [NumarAuto] nvarchar(max)  NOT NULL,
    [SerieSasiu] nvarchar(max)  NOT NULL,
    [ClientId] nvarchar(max)  NOT NULL,
    [Sasiu_SasiuId] int  NOT NULL
);
GO

-- Creating table 'Sasiuri'
CREATE TABLE [dbo].[Sasiuri] (
    [SasiuId] int IDENTITY(1,1) NOT NULL,
    [CodSasiu] nvarchar(max)  NOT NULL,
    [Denumire] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Mecanici'
CREATE TABLE [dbo].[Mecanici] (
    [MecanicId] int IDENTITY(1,1) NOT NULL,
    [Nume] nvarchar(max)  NOT NULL,
    [Prenume] nvarchar(max)  NOT NULL,
    [DetaliuComandaDetaliuComandaId] int  NOT NULL
);
GO

-- Creating table 'Materiale'
CREATE TABLE [dbo].[Materiale] (
    [MaterialId] int IDENTITY(1,1) NOT NULL,
    [Denumire] nvarchar(max)  NOT NULL,
    [Cantitate] float  NOT NULL,
    [Pret] float  NOT NULL,
    [DataAprovizinare] datetime  NOT NULL,
    [DetaliuComandaDetaliuComandaId] int  NOT NULL
);
GO

-- Creating table 'Imagines'
CREATE TABLE [dbo].[Imagines] (
    [ImagineId] int IDENTITY(1,1) NOT NULL,
    [Titlu] nvarchar(max)  NOT NULL,
    [Descriere] nvarchar(max)  NOT NULL,
    [Data] datetime  NOT NULL,
    [Foto] varbinary(max)  NOT NULL,
    [DetaliuComanda_DetaliuComandaId] int  NOT NULL
);
GO

-- Creating table 'Operatii'
CREATE TABLE [dbo].[Operatii] (
    [OperatieId] int IDENTITY(1,1) NOT NULL,
    [Denumire] nvarchar(max)  NOT NULL,
    [TimpExecutie] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'Comenzi'
CREATE TABLE [dbo].[Comenzi] (
    [ComandaId] int IDENTITY(1,1) NOT NULL,
    [StareComanda] nvarchar(max)  NOT NULL,
    [DataSystem] datetime  NOT NULL,
    [DataProgramare] datetime  NOT NULL,
    [DataFinalizare] datetime  NOT NULL,
    [KmBord] int  NOT NULL,
    [Descriere] nvarchar(max)  NOT NULL,
    [ValoarePiese] decimal(18,0)  NOT NULL,
    [OperatieOperatieId] int  NOT NULL,
    [Auto_AutoId] int  NOT NULL,
    [Client_ClientId] int  NOT NULL
);
GO

-- Creating table 'DetaliuComandas'
CREATE TABLE [dbo].[DetaliuComandas] (
    [DetaliuComandaId] int IDENTITY(1,1) NOT NULL,
    [Comanda_ComandaId] int  NOT NULL,
    [Operatie_OperatieId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ClientId] in table 'Clienti'
ALTER TABLE [dbo].[Clienti]
ADD CONSTRAINT [PK_Clienti]
    PRIMARY KEY CLUSTERED ([ClientId] ASC);
GO

-- Creating primary key on [AutoId] in table 'Autos'
ALTER TABLE [dbo].[Autos]
ADD CONSTRAINT [PK_Autos]
    PRIMARY KEY CLUSTERED ([AutoId] ASC);
GO

-- Creating primary key on [SasiuId] in table 'Sasiuri'
ALTER TABLE [dbo].[Sasiuri]
ADD CONSTRAINT [PK_Sasiuri]
    PRIMARY KEY CLUSTERED ([SasiuId] ASC);
GO

-- Creating primary key on [MecanicId] in table 'Mecanici'
ALTER TABLE [dbo].[Mecanici]
ADD CONSTRAINT [PK_Mecanici]
    PRIMARY KEY CLUSTERED ([MecanicId] ASC);
GO

-- Creating primary key on [MaterialId] in table 'Materiale'
ALTER TABLE [dbo].[Materiale]
ADD CONSTRAINT [PK_Materiale]
    PRIMARY KEY CLUSTERED ([MaterialId] ASC);
GO

-- Creating primary key on [ImagineId] in table 'Imagines'
ALTER TABLE [dbo].[Imagines]
ADD CONSTRAINT [PK_Imagines]
    PRIMARY KEY CLUSTERED ([ImagineId] ASC);
GO

-- Creating primary key on [OperatieId] in table 'Operatii'
ALTER TABLE [dbo].[Operatii]
ADD CONSTRAINT [PK_Operatii]
    PRIMARY KEY CLUSTERED ([OperatieId] ASC);
GO

-- Creating primary key on [ComandaId] in table 'Comenzi'
ALTER TABLE [dbo].[Comenzi]
ADD CONSTRAINT [PK_Comenzi]
    PRIMARY KEY CLUSTERED ([ComandaId] ASC);
GO

-- Creating primary key on [DetaliuComandaId] in table 'DetaliuComandas'
ALTER TABLE [dbo].[DetaliuComandas]
ADD CONSTRAINT [PK_DetaliuComandas]
    PRIMARY KEY CLUSTERED ([DetaliuComandaId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Sasiu_SasiuId] in table 'Autos'
ALTER TABLE [dbo].[Autos]
ADD CONSTRAINT [FK_AutoSasiu]
    FOREIGN KEY ([Sasiu_SasiuId])
    REFERENCES [dbo].[Sasiuri]
        ([SasiuId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AutoSasiu'
CREATE INDEX [IX_FK_AutoSasiu]
ON [dbo].[Autos]
    ([Sasiu_SasiuId]);
GO

-- Creating foreign key on [Auto_AutoId] in table 'Clienti'
ALTER TABLE [dbo].[Clienti]
ADD CONSTRAINT [FK_ClientAuto]
    FOREIGN KEY ([Auto_AutoId])
    REFERENCES [dbo].[Autos]
        ([AutoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientAuto'
CREATE INDEX [IX_FK_ClientAuto]
ON [dbo].[Clienti]
    ([Auto_AutoId]);
GO

-- Creating foreign key on [DetaliuComanda_DetaliuComandaId] in table 'Imagines'
ALTER TABLE [dbo].[Imagines]
ADD CONSTRAINT [FK_ImagineDetaliuComanda]
    FOREIGN KEY ([DetaliuComanda_DetaliuComandaId])
    REFERENCES [dbo].[DetaliuComandas]
        ([DetaliuComandaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImagineDetaliuComanda'
CREATE INDEX [IX_FK_ImagineDetaliuComanda]
ON [dbo].[Imagines]
    ([DetaliuComanda_DetaliuComandaId]);
GO

-- Creating foreign key on [Auto_AutoId] in table 'Comenzi'
ALTER TABLE [dbo].[Comenzi]
ADD CONSTRAINT [FK_ComandaAuto]
    FOREIGN KEY ([Auto_AutoId])
    REFERENCES [dbo].[Autos]
        ([AutoId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComandaAuto'
CREATE INDEX [IX_FK_ComandaAuto]
ON [dbo].[Comenzi]
    ([Auto_AutoId]);
GO

-- Creating foreign key on [Client_ClientId] in table 'Comenzi'
ALTER TABLE [dbo].[Comenzi]
ADD CONSTRAINT [FK_ComandaClient]
    FOREIGN KEY ([Client_ClientId])
    REFERENCES [dbo].[Clienti]
        ([ClientId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComandaClient'
CREATE INDEX [IX_FK_ComandaClient]
ON [dbo].[Comenzi]
    ([Client_ClientId]);
GO

-- Creating foreign key on [Comanda_ComandaId] in table 'DetaliuComandas'
ALTER TABLE [dbo].[DetaliuComandas]
ADD CONSTRAINT [FK_DetaliuComandaComanda]
    FOREIGN KEY ([Comanda_ComandaId])
    REFERENCES [dbo].[Comenzi]
        ([ComandaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DetaliuComandaComanda'
CREATE INDEX [IX_FK_DetaliuComandaComanda]
ON [dbo].[DetaliuComandas]
    ([Comanda_ComandaId]);
GO

-- Creating foreign key on [DetaliuComandaDetaliuComandaId] in table 'Mecanici'
ALTER TABLE [dbo].[Mecanici]
ADD CONSTRAINT [FK_DetaliuComandaMecanic]
    FOREIGN KEY ([DetaliuComandaDetaliuComandaId])
    REFERENCES [dbo].[DetaliuComandas]
        ([DetaliuComandaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DetaliuComandaMecanic'
CREATE INDEX [IX_FK_DetaliuComandaMecanic]
ON [dbo].[Mecanici]
    ([DetaliuComandaDetaliuComandaId]);
GO

-- Creating foreign key on [DetaliuComandaDetaliuComandaId] in table 'Materiale'
ALTER TABLE [dbo].[Materiale]
ADD CONSTRAINT [FK_DetaliuComandaMaterial]
    FOREIGN KEY ([DetaliuComandaDetaliuComandaId])
    REFERENCES [dbo].[DetaliuComandas]
        ([DetaliuComandaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DetaliuComandaMaterial'
CREATE INDEX [IX_FK_DetaliuComandaMaterial]
ON [dbo].[Materiale]
    ([DetaliuComandaDetaliuComandaId]);
GO

-- Creating foreign key on [OperatieOperatieId] in table 'Comenzi'
ALTER TABLE [dbo].[Comenzi]
ADD CONSTRAINT [FK_OperatieComanda]
    FOREIGN KEY ([OperatieOperatieId])
    REFERENCES [dbo].[Operatii]
        ([OperatieId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OperatieComanda'
CREATE INDEX [IX_FK_OperatieComanda]
ON [dbo].[Comenzi]
    ([OperatieOperatieId]);
GO

-- Creating foreign key on [Operatie_OperatieId] in table 'DetaliuComandas'
ALTER TABLE [dbo].[DetaliuComandas]
ADD CONSTRAINT [FK_DetaliuComandaOperatie]
    FOREIGN KEY ([Operatie_OperatieId])
    REFERENCES [dbo].[Operatii]
        ([OperatieId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DetaliuComandaOperatie'
CREATE INDEX [IX_FK_DetaliuComandaOperatie]
ON [dbo].[DetaliuComandas]
    ([Operatie_OperatieId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------