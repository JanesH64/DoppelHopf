import { PrismaClient, Profile } from '@prisma/client';

const prisma = new PrismaClient();
export default defineEventHandler(async (_) => {
    const profiles: Profile[] = await prisma.profile.findMany();
    return profiles;
})