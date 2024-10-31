import 'package:flutter/material.dart';
import 'package:ludo/gameengine/path.dart';
import './position.dart';
import './token.dart';

class GameState with ChangeNotifier {
  List<Token> gameTokens = [];
  late List<Position> starPositions;
  List<Position> greenInitital = [];
  List<Position> yellowInitital = [];
  List<Position> blueInitital = [];
  List<Position> redInitital = [];

GameState() {
    // Initialize game tokens directly with their values
    this.gameTokens = [
      // Green Tokens home
      Token(TokenType.green, Position(2, 2), TokenState.initial, 0),
      Token(TokenType.green, Position(2, 3), TokenState.initial, 1),
      Token(TokenType.green, Position(3, 2), TokenState.initial, 2),
      Token(TokenType.green, Position(3, 3), TokenState.initial, 3),
      // Yellow Tokens
      Token(TokenType.yellow, Position(2, 11), TokenState.initial, 4),
      Token(TokenType.yellow, Position(2, 12), TokenState.initial, 5),
      Token(TokenType.yellow, Position(3, 11), TokenState.initial, 6),
      Token(TokenType.yellow, Position(3, 12), TokenState.initial, 7),
      // Blue Tokens
      Token(TokenType.blue, Position(11, 11), TokenState.initial, 8),
      Token(TokenType.blue, Position(11, 12), TokenState.initial, 9),
      Token(TokenType.blue, Position(12, 11), TokenState.initial, 10),
      Token(TokenType.blue, Position(12, 12), TokenState.initial, 11),
      // Red Tokens
      Token(TokenType.red, Position(11, 2), TokenState.initial, 12),
      Token(TokenType.red, Position(11, 3), TokenState.initial, 13),
      Token(TokenType.red, Position(12, 2), TokenState.initial, 14),
      Token(TokenType.red, Position(12, 3), TokenState.initial, 15),
    ];

    // Initialize the star positions
    this.starPositions = [
      Position(6, 1),
      Position(2, 6),
      Position(1, 8),
      Position(6, 12),
      Position(8, 13),
      Position(12, 8),
      Position(13, 6),
      Position(8, 2)
    ];
  }
  void moveToken(Token token, int steps) {
    Position? destination;
    int pathPosition;

    if (token.tokenState == TokenState.home) return;
    if (token.tokenState == TokenState.initial && steps != 6) return;
    if (token.tokenState == TokenState.initial && steps == 6) {
      destination = _getPosition(token.type, 0);
      pathPosition = 0;
      _updateInitalPositions(token);
      _updateBoardState(token, destination, pathPosition);
      gameTokens[token.id].tokenPosition = destination;
      gameTokens[token.id].positionInPath = pathPosition;
      notifyListeners();
    } else if (token.tokenState != TokenState.initial) {
      int step = token.positionInPath + steps;
      if (step > 56) return;

      destination = _getPosition(token.type, step);
      pathPosition = step;
      var cutToken = _updateBoardState(token, destination, pathPosition);

      for (int i = 1; i <= steps; i++) {
        Future.delayed(Duration(milliseconds: i * 500), () {
          int stepLoc = token.positionInPath + 1;
          gameTokens[token.id].tokenPosition = _getPosition(token.type, stepLoc);
          gameTokens[token.id].positionInPath = stepLoc;
          token.positionInPath = stepLoc;
          notifyListeners();
        });
      }

      if (cutToken != null) {
        for (int i = 1; i <= cutToken.positionInPath; i++) {
          Future.delayed(Duration(milliseconds: steps * 500 + i * 100), () {
            int stepLoc = cutToken.positionInPath - 1;
            gameTokens[cutToken.id].tokenPosition = _getPosition(cutToken.type, stepLoc);
            gameTokens[cutToken.id].positionInPath = stepLoc;
            cutToken.positionInPath = stepLoc;
            notifyListeners();
          });
        }

        Future.delayed(Duration(milliseconds: steps * 500 + cutToken.positionInPath * 100), () {
          _cutToken(cutToken);
          notifyListeners();
        });
      }
    }
  }

  Token? _updateBoardState(Token token, Position destination, int pathPosition) {
    Token? cutToken;

    if (starPositions.contains(destination)) {
      gameTokens[token.id].tokenState = TokenState.safe;
      return null;
    }

    List<Token> tokenAtDestination = gameTokens.where((tkn) => tkn.tokenPosition == destination).toList();

    if (tokenAtDestination.isEmpty) {
      gameTokens[token.id].tokenState = TokenState.normal;
      return null;
    }

    List<Token> tokenAtDestinationSameType = tokenAtDestination.where((tkn) => tkn.type == token.type).toList();

    if (tokenAtDestinationSameType.length == tokenAtDestination.length) {
      for (Token tkn in tokenAtDestinationSameType) {
        gameTokens[tkn.id].tokenState = TokenState.safeinpair;
      }
      gameTokens[token.id].tokenState = TokenState.safeinpair;
      return null;
    }

    for (Token tkn in tokenAtDestination) {
      if (tkn.type != token.type && tkn.tokenState != TokenState.safeinpair) {
        cutToken = tkn;
      } else if (tkn.type == token.type) {
        gameTokens[tkn.id].tokenState = TokenState.safeinpair;
      }
    }

    gameTokens[token.id].tokenState =
        tokenAtDestinationSameType.isNotEmpty ? TokenState.safeinpair : TokenState.normal;

    return cutToken;
  }

  void _updateInitalPositions(Token token) {
    switch (token.type) {
      case TokenType.green:
        greenInitital.add(token.tokenPosition);
        break;
      case TokenType.yellow:
        yellowInitital.add(token.tokenPosition);
        break;
      case TokenType.blue:
        blueInitital.add(token.tokenPosition);
        break;
      case TokenType.red:
        redInitital.add(token.tokenPosition);
        break;
    }
  }

  void _cutToken(Token token) {
    switch (token.type) {
      case TokenType.green:
        gameTokens[token.id].tokenState = TokenState.initial;
        gameTokens[token.id].tokenPosition = greenInitital.first;
        greenInitital.removeAt(0);
        break;
      case TokenType.yellow:
        gameTokens[token.id].tokenState = TokenState.initial;
        gameTokens[token.id].tokenPosition = yellowInitital.first;
        yellowInitital.removeAt(0);
        break;
      case TokenType.blue:
        gameTokens[token.id].tokenState = TokenState.initial;
        gameTokens[token.id].tokenPosition = blueInitital.first;
        blueInitital.removeAt(0);
        break;
      case TokenType.red:
        gameTokens[token.id].tokenState = TokenState.initial;
        gameTokens[token.id].tokenPosition = redInitital.first;
        redInitital.removeAt(0);
        break;
    }
  }

  Position _getPosition(TokenType type, int step) {
    List<int> node;
    switch (type) {
      case TokenType.green:
        node = Path.greenPath[step];
        break;
      case TokenType.yellow:
        node = Path.yellowPath[step];
        break;
      case TokenType.blue:
        node = Path.bluePath[step];
        break;
      case TokenType.red:
        node = Path.redPath[step];
        break;
    }
    return Position(node[0], node[1]);
  }
}