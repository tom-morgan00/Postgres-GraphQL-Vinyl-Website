import { dateScalar } from '../typeDefs';
import ArtistResolver from './ArtistResolver';
import ProductResolver from './ProductResolver';

export default {
  Date: dateScalar,
  Query: {
    ...ArtistResolver.Query,
    ...ProductResolver.Query,
  },
};
