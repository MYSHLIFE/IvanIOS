//
//  Position.h
//  PSH05
//
//  Created by Ivan on 12/1/14.
//  Copyright (c) 2014 Ivan. All rights reserved.
//

#ifndef PSH05_Position_h
#define PSH05_Position_h

typedef struct Position{
    NSInteger x;
    NSInteger y;
}Position;
CG_INLINE Position PositionMake(NSInteger x,NSInteger y){
    Position position;
    position.x =x;
    position.y = y;
    return position;
}
#endif
