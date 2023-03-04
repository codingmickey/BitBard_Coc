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

export const TripCard = React.memo(function ReviewCard() {
  const styles = useStyles();
  const mediaStyles = useWideCardMediaStyles();
  const shadowStyles = useFadedShadowStyles();
  const gutterStyles = usePushingGutterStyles({ firstExcluded: true });
  return (
    <Card elevation={0} className={styles.root}>
      <CardMedia
        classes={mediaStyles}
        image={
          TripImage
          // 'http://localhost:3001/assets/trip.avif'
          // 'https://images.unsplash.com/photo-1515542622106-78bda8ba0e5b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80'
        }
      />
      <CardContent className={cx(shadowStyles.root, styles.content)}>
        {/* <IconButton className={styles.favorite}>
          <FavoriteIcon />
        </IconButton> */}
        <h3 className={styles.title}>Colloseo</h3>
        <Box color={'grey.500'} display={'flex'} alignItems={'center'} mb={1}>
          <LocationOnIcon className={styles.locationIcon} />
          <span>Rome</span>
        </Box>
        <Box display={'flex'} alignItems={'center'} mb={1} className={gutterStyles.parent}>
          <Rating name={'rating'} readOnly value={2} size={'small'} />
          <Typography variant={'body2'} className={styles.rateValue}>
            4.0
          </Typography>
        </Box>
        <Typography color={'textSecondary'} variant={'body2'}>
          Talking about travelling or new jobs, many people often think of change of environment...
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
      </CardContent>
    </Card>
  );
});

export default TripCard;
