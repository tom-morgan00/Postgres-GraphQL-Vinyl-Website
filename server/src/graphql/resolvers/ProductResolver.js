import knex from '../../db';

// Provide resolver functions for your schema fields
const ProductResolver = {
  Query: {
    getProducts: async () => {
      const products = await knex('album')
        .join('artist', 'artist.id', 'album.artist_id')
        .select('album.*', 'artist.name as artist');

      return products;
    },
    getProduct: async (_, { id }) => {
      const [product] = await knex('album')
        .join('artist', 'artist.id', 'album.artist_id')
        .select('album.*', 'artist.name as artist')
        .whereRaw('album.id = ?', [id]);

      return !!product ? product : new Error('product not found');
    },
    getProductsByArtist: async (_, { id }) => {
      const products = await knex('album')
        .join('artist', 'artist.id', 'album.artist_id')
        .select('album.*', 'artist.name as artist')
        .whereRaw('artist.id = ?', [id]);

      return products;
    },
    getRecommendedAlbums: async () => {
      const albums = await knex('album')
        .join('artist', 'artist.id', 'album.artist_id')
        .select('album.*', 'artist.name as artist')
        .whereRaw('album.recommended = TRUE');

      return albums;
    },
    getProductsOrderBy: async (_, { column, order }) => {
      const albums = await knex('album')
        .join('artist', 'artist.id', 'album.artist_id')
        .select('album.*', 'artist.name as artist')
        .orderByRaw(`${column ? column : 'id'} ${order ? order : 'ASC'}`);

      return albums;
    },
  },
};

export default ProductResolver;
