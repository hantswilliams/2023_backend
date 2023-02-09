-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "uuidv4" TEXT,
    "email" TEXT,
    "isDisabled" BOOLEAN DEFAULT false,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateModified" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateLastLogin" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Instagram" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "igaccountRelationship" TEXT DEFAULT 'owner',
    "igusername" TEXT,
    "igoauthid" TEXT,
    "igtoken" TEXT,
    "iguserid" TEXT,
    "igmediacount" TEXT,
    "igaccounttype" TEXT,

    CONSTRAINT "Instagram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Media" (
    "id" SERIAL NOT NULL,
    "media_uid" TEXT,
    "media_type" TEXT,
    "origin" TEXT,
    "medial_url" TEXT,
    "s3bucket_key" TEXT,
    "permalink" TEXT,
    "title" TEXT,
    "content" TEXT,
    "authorId" TEXT NOT NULL,
    "timestampMedia" TIMESTAMP(3),

    CONSTRAINT "Media_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cognition" (
    "id" SERIAL NOT NULL,
    "model" TEXT,
    "modelsubtype" TEXT,
    "output" JSONB,
    "outputcleaned" JSONB,
    "mediaId" TEXT NOT NULL,

    CONSTRAINT "Cognition_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_uuidv4_key" ON "Users"("uuidv4");

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Instagram_igusername_key" ON "Instagram"("igusername");

-- CreateIndex
CREATE UNIQUE INDEX "Media_media_uid_key" ON "Media"("media_uid");

-- AddForeignKey
ALTER TABLE "Instagram" ADD CONSTRAINT "Instagram_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("uuidv4") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Media" ADD CONSTRAINT "Media_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "Instagram"("igusername") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cognition" ADD CONSTRAINT "Cognition_mediaId_fkey" FOREIGN KEY ("mediaId") REFERENCES "Media"("media_uid") ON DELETE RESTRICT ON UPDATE CASCADE;
