import React from 'react';
import cx from 'clsx';
import { makeStyles } from '@mui/styles';

import LocationOnIcon from '@mui/icons-material/LocationOn';
import MoreHorizIcon from '@mui/icons-material/MoreHoriz';
import FavoriteIcon from '@mui/icons-material/Favorite';
import { Box, Card, CardMedia, CardContent, Typography, Rating, IconButton } from '@mui/material';
import FaceGroup from '@mui-treasury/components/group/face';
import { useWideCardMediaStyles } from '@mui-treasury/styles/cardMedia/wide';
import { useFadedShadowStyles } from '@mui-treasury/styles/shadow/faded';
import { usePushingGutterStyles } from '@mui-treasury/styles/gutter/pushing';
import TripImage from '../assets/trip.avif';

const useStyles = makeStyles(() => ({
  root: {
    overflow: 'initial',
    maxWidth: 304,
    backgroundColor: 'transparent'
  },
  title: {
    marginBottom: 0
  },
  rateValue: {
    fontWeight: 'bold',
    marginTop: 2
  },
  content: {
    position: 'relative',
    padding: 24,
    margin: '-24% 16px 0',
    backgroundColor: '#fff',
    borderRadius: 4
  },
  favorite: {
    position: 'absolute',
    top: 12,
    left: 12
  },
  locationIcon: {
    marginRight: 4,
    fontSize: 18
  }
}));

export const TripCard = React.memo(function ReviewCard({
  image,
  title,
  price,
  desc,
  dates,
  location,
  rating,
  description,
  ...props
}) {
  const styles = useStyles();
  const mediaStyles = useWideCardMediaStyles();
  const shadowStyles = useFadedShadowStyles();
  const gutterStyles = usePushingGutterStyles({ firstExcluded: true });
  return (
    <Card elevation={0} className={styles.root}>
      <CardMedia
        classes={mediaStyles}
        image={
          image
          // 'http://localhost:3001/assets/trip.avif'
          // 'https://images.unsplash.com/photo-1515542622106-78bda8ba0e5b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80'
        }
      />
      <CardContent className={cx(shadowStyles.root, styles.content)}>
        {/* <IconButton className={styles.favorite}>
          <FavoriteIcon />
        </IconButton> */}
        <h3 className={styles.title} style={{ textAlign: 'center' }}>
          {title}
        </h3>
        <Box color={'grey.500'} display={'flex'} justifyContent="center" mb={1}>
          <LocationOnIcon className={styles.locationIcon} />
          <span>{location}</span>
        </Box>
        <Typography color={'textSecondary'} variant={'body2'}>
          {desc.slice(0, 100)}
          ...{' '}
        </Typography>
        <Box mt={2} display={'flex'} justifyContent={'space-between'} alignItems={'center'}>
          <Box display={'flex'} alignItems={'center'} className={gutterStyles.parent}>
            <FaceGroup
              faces={[
                'https://i.pravatar.cc/300?img=1',
                'https://i.pravatar.cc/300?img=2',
                'https://i.pravatar.cc/300?img=3',
                'https://i.pravatar.cc/300?img=4'
              ]}
              size={32}
              offset={-12}
            />
            <Typography component={'span'} variant={'body2'} color={'textSecondary'}>
              +420
            </Typography>
          </Box>
          <IconButton size={'small'}>
            <MoreHorizIcon />
          </IconButton>
        </Box>
        <Box mt={2} display={'flex'} justifyContent={'space-between'} alignItems={'center'}>
          <Box display={'flex'} alignItems={'center'}>
            <Typography variant={'h6'} color={'textPrimary'}>
              ₹ {price}
            </Typography>
            <Typography component={'span'} variant={'body2'} color={'textSecondary'}>
              /person
            </Typography>
          </Box>
        </Box>
        <Box mt={2} display={'flex'} justifyContent={'space-between'} alignItems={'center'}>
          <Box display={'flex'} alignItems={'center'}>
            Dates:
            <Typography ml="5px" mt="3px" component={'span'} variant={'h6'} color={'textSecondary'}>
              {dates}
            </Typography>
          </Box>
        </Box>
      </CardContent>
    </Card>
  );
});

export default TripCard;
