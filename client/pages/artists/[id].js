import React from 'react';
import { useRouter } from 'next/router';
import { useQuery } from '@apollo/client';
import { GET_ARTIST_BY_ID } from '../../graphql/queries/getArtists.graphql';
import classes from '../../styles/components/Others.module.css';
import Products from '../../components/Products/Products';
import ArtistDetails from '../../components/Artists/ArtistDetails';
import Layout from '../../components/Layout';

export default function artist() {
  const router = useRouter();
  const id = router.query.id;
  const { loading, error, data } = useQuery(GET_ARTIST_BY_ID, {
    variables: { id },
    skip: id === undefined,
  });
  console.log(id);
  console.log(data);

  if (loading) {
    return <div>Loading...</div>;
  }
  if (error) {
    return <div>{error.message}</div>;
  }

  if (data && data.getArtistByID) {
    const { albums } = data.getArtistByID;

    return (
      <Layout>
        <main className={classes.main}>
          <ArtistDetails artist={data.getArtistByID.artist} />

          <Products products={albums} />
        </main>
      </Layout>
    );
  }

  return null;
}
