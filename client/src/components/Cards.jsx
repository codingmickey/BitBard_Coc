import { Badge, Box, Card, CardContent, CardMedia, Chip, Typography } from '@mui/material';
import PermIdentityIcon from '@mui/icons-material/PermIdentity';
import LocalPhoneIcon from '@mui/icons-material/LocalPhone';
import TranslateIcon from '@mui/icons-material/Translate';
const cardsData = [
  {
    id: 1,
    title: 'Identity Verified',
    image: <PermIdentityIcon />,
    description: 'Verify your identity quickly and securely with our easy-to-use system.'
  },
  {
    id: 2,
    title: 'Phone Verified',
    image: <LocalPhoneIcon />,
    description: 'Confirm your phone number with a quick and simple verification process.'
  },
  {
    id: 3,
    title: 'Spoken Languages',
    image: <TranslateIcon />,
    description: 'Find language tutors and practice speaking with native speakers.'
  }
];
const Cards = () => {
  return (
    <Box style={{ display: 'flex', justifyContent: 'space-between' }} spacing={4}>
      {cardsData.map((badge) => (
        <Chip key={badge.id} overlap="circular" label={badge.title} deleteIcon={badge.image}>
          <Typography variant="h6">{badge.title}</Typography>
        </Chip>
      ))}
    </Box>
  );
};

export default Cards;
