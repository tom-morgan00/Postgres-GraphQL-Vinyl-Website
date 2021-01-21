import React from 'react';
import classes from '../../styles/pages/ArtistDetails.module.css';

export default function ArtistDetails({ artist }) {
  return artist ? (
    <section className={classes.artistDetails}>
      <h1 className={classes.title}>{artist.name}</h1>
      <div className={classes.image}>
        <img src={artist.photo} alt={artist.name} />
      </div>
      <div className={classes.artistInfo}>
        <ul>
          {artist.members.map((member) => (
            <li key={member}>{member}</li>
          ))}
        </ul>
        <div>
          <h4>From {artist.place_of_origin}</h4>

          <h4>Since {artist.year_formed}</h4>
        </div>
      </div>
    </section>
  ) : null;
}
