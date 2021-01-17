import knex from '../../db';

// Provide resolver functions for your schema fields
const ArtistResolver = {
  Query: {
    getArtists: async () => {
      const artists = await knex('artist').select('*');

      return artists;
    },

    getArtist: async (_, { id }) => {
      const [artist] = await knex('artist').select('*').where({ id });

      console.log(artist);
      return !!artist ? artist : new Error('artist not found');
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
  },
};

export default ArtistResolver;
