import { useQuery } from '@apollo/client';
import React from 'react';
import classes from '../../styles/Album.module.css';
import { GET_RECOMMENDED_ALBUMS } from '../../graphql/queries/getAlbums.graphql';
import NextLink from 'next/link';

export default function Albums() {
  const { loading, error, data } = useQuery(GET_RECOMMENDED_ALBUMS);
  console.log(data);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>{error.message}</div>;

  return (
    <section className={classes.albumSection}>
      <h2 className={classes.title}>Recommended Albums</h2>

      <section className={classes.albums}>
        {data &&
          data.getRecommendedAlbums.map((album) => {
            return (
              <div key={album.id} className={classes.album}>
                <div className={classes.albumImage}>
                  <NextLink href={`/products/${album.id}`}>
                    <img src={album.image} alt={album.title} />
                  </NextLink>
                </div>
                <div className={classes.albumInfo}>
                  <h5>{album.title}</h5>
                  <p>{album.artist}</p>
                  <p>£{album.price}</p>
                  <div className={classes.button}>
                    <button>Add to Cart</button>
                  </div>
                </div>
              </div>
            );
          })}
      </section>
    </section>
  );
}
