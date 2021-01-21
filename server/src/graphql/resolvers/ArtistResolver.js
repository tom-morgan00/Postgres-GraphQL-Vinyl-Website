import knex from '../../db';

// Provide resolver functions for your schema fields
const ArtistResolver = {
  Query: {
    getArtists: async () => {
      const artists = await knex('artist').select('*');

      return artists;
    },

    getArtistByID: async (_, { id }) => {
      const [artist] = await knex('artist').select('*').where({ id });

      const albums = await knex('album')
        .select('*')
        .where({ artist_id: id })
        .orderByRaw('release_date ASC');

      return !!artist ? { artist, albums } : new Error('artist not found');
    },
    getFavouriteArtists: async () => {
      const artists = await knex('artist')
        .select('*')
        .whereRaw('favourite = TRUE');

      const both = artists.map((artist) => {
        return (async ({ id }) => {
          let albums = await knex('album')
            .select('id', 'title', 'image')
            .whereRaw('album.artist_id = ?', [id])
            .orderByRaw('title ASC')
            .limit(3);
          return {
            artist,
            albums,
          };
        })(artist);
      });

      // console.log(artists);
      return both;
    },
    getArtistsAndAlbums: async () => {
      const artists = await knex('artist').select('*');

      const both = artists.map((artist) => {
        return (async ({ id }) => {
          let albums = await knex('album')
            .select('id', 'title', 'image')
            .whereRaw('album.artist_id = ?', [id])
            .limit(3);

          return {
            artist,
            albums,
          };
        })(artist);
      });

      // console.log(artists);
      return both;
    },
  },
};

export default ArtistResolver;
