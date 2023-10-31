import { PrismaClient, Profile } from '@prisma/client';
import { defineEventHandler } from 'h3';

const prisma = new PrismaClient();
export default defineEventHandler(async (event) => {
    const profiles: Profile[] = await prisma.profile.findMany();
    return profiles;
})