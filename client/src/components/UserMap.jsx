import React, { useState } from 'react';
import { ComposableMap, Geographies, Geography, Marker } from 'react-simple-maps';
import worldData from './worldData.json';
import { Typography } from '@mui/material';

const visitedCountries = ['United States of America', 'Saudi Arabia', 'India', 'Kazakhstan']; // Example list of visited countries

const WorldMap = () => {
  const [tooltipContent, setTooltipContent] = useState('');

  console.log(worldData.features);

  return (
    <div>
      <ComposableMap projection="geoMercator" height={500}>
        <Geographies geography={worldData}>
          {({ geographies }) => (
            <>
              {geographies.map((geo) => (
                <>
                  <Geography
                    key={geo.rsmKey}
                    geography={geo}
                    onMouseEnter={() => {
                      const { name } = geo.properties;
                      console.log(geo);
                      setTooltipContent(`${name}`);
                    }}
                    onMouseLeave={() => {
                      setTooltipContent('');
                    }}
                    style={{
                      default: {
                        fill: visitedCountries.includes(geo.properties.name) ? '#F53' : '#D6D6DA',
                        outline: 'none'
                      },
                      hover: {
                        fill: visitedCountries.includes(geo.properties.name) ? '#F53' : '#99d5cf',
                        outline: 'none'
                      },
                      pressed: {
                        fill: visitedCountries.includes(geo.properties.name) ? '#F53' : '#F53',
                        outline: 'none'
                      }
                    }}
                  />
                </>
              ))}
              {visitedCountries.map((country) => {
                const geo = geographies.find((geo) => geo.properties.name === country);
                if (geo) {
                  return (
                    <Marker key={country} coordinates={[geo.geometry.coordinates]}>
                      <circle r={6} fill="#F53" />
                    </Marker>
                  );
                } else {
                  return null;
                }
              })}
            </>
          )}
        </Geographies>
      </ComposableMap>
      <Typography variant="h3" style={{ marginTop: '20px', textAlign: 'center' }}>
        {tooltipContent}
      </Typography>
    </div>
  );
};

export default WorldMap;
