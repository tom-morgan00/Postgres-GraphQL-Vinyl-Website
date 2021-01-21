import { useQuery } from '@apollo/client';
import React from 'react';
import Layout from '../components/Layout';
import classes from '../styles/Artist.module.css';
import { GET_ARTISTS_AND_ALBUMS } from '../graphql/queries/getArtists.graphql';
import NextLink from 'next/link';

export default function artists() {
  const { loading, error, data } = useQuery(GET_ARTISTS_AND_ALBUMS);
  console.log(data);

  if (loading) {
    return <div>Loading...</div>;
  }
  if (error) {
    return <div>{error.message}</div>;
  }
  return (
    <div>
      <Layout>
        <main>
          <section className={classes.artistSection}>
            <h2 className={classes.title}>Artists</h2>

            {data &&
              data.getArtistsAndAlbums.map(({ artist, albums }) => {
                return (
                  <div className={classes.artist} key={artist.id}>
                    <div className={classes.artistImage}>
                      <NextLink href={`/artists/${artist.id}`}>
                        <img src={artist.photo} alt={artist.name} />
                      </NextLink>
                      <h2>{artist.name}</h2>
                    </div>
                    <div className={classes.artistInfo}>
                      <ul>
                        <li>
                          <h4>Band Members</h4>
                          {artist.members.map((member) => (
                            <p key={member}>{member}</p>
                          ))}
                        </li>
                        <li>
                          <h4>From {artist.place_of_origin}</h4>
                          <h4>Since {artist.year_formed}</h4>
                        </li>
                      </ul>
                      <div className={classes.artistAlbums}>
                        {albums.map((album) => {
                          return (
                            <div key={album.id} className={classes.artistAlbum}>
                              <div className={classes.artistAlbumImage}>
                                <NextLink href={`/products/${album.id}`}>
                                  <img src={album.image} alt={album.title} />
                                </NextLink>
                              </div>
                              <h5>{album.title}</h5>
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  </div>
                );
              })}
          </section>
        </main>
      </Layout>
    </div>
  );
}
