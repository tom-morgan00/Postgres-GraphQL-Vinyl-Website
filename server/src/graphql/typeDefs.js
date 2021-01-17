import { gql } from 'apollo-server-express';
import { GraphQLScalarType, Kind } from 'graphql';

// Construct a schema, using GraphQL schema language
const typeDefs = gql`
  scalar Date

  type Product {
    id: ID!
    title: String
    artist: String
    price: Float
    image: String
    label: String
    release_date: Date
    tracklist: [String]
  }

  type Artist {
    id: ID!
    name: String
    members: [String]
    photo: String
    year_formed: Int
    place_of_origin: String
  }

  type Both {
    artist: Artist
    albums: [Product]
  }

  type Query {
    hello: String
    getProducts: [Product]
    getProduct(id: ID!): Product
    getProductsByArtist(id: ID!): [Product]
    getArtists: [Artist]
    getArtist(id: ID!): Artist
    getFavouriteArtists: [Both]
    getRecommendedAlbums: [Product]
  }
`;

export const dateScalar = new GraphQLScalarType({
  name: 'Date',
  description: 'Date custom scalar type',
  serialize(value) {
    return value.getTime(); // Convert outgoing Date to integer for JSON
  },
  parseValue(value) {
    return new Date(value); // Convert incoming integer to Date
  },
  parseLiteral(ast) {
    if (ast.kind === Kind.INT) {
      return parseInt(ast.value, 10); // Convert hard-coded AST string to type expected by parseValue
    }
    return null; // Invalid hard-coded value (not an integer)
  },
});

export default typeDefs;
