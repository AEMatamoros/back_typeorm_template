var jwt = require('jsonwebtoken');
const url = require('url');


function verifyToken(req, res, next) {
    if(req.headers['authorization']){
        var token:any = req.headers['authorization'].replace("Bearer ","");
        if (!token){
            return res.status(403).send({
                auth: false, 
                title:"Acceso No Autorizado", 
                message:"Intento acceder a un recurso prohibido"
            });
        }
        jwt.verify(token, process.env.TOKEN_SECRET_KEY_ADMIN, function(err, decoded) {
            if (err){
                return res.status(403).send({
                    auth: false,
                    title:"Acceso No Autorizado",
                    message:"Intento acceder a un recurso prohibido"});
            }
            req.user_id = decoded.id;
            next();
        });
    }else{
        return res.status(403).send({
            auth: false,
            title:"Acceso No Autorizado",
            message:"Intento acceder a un recurso prohibido"
        });
    }
}

export const verifyTokenAdmin = verifyToken