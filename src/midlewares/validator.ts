import { NextFunction } from 'express';

import { validationResult } from 'express-validator';

export const validarCampos = (req, res, next:NextFunction)=>{
    const errors = validationResult( req );
    if(!errors.isEmpty()){
        return res.status(400).json({ title:"Campos requeridos",
        msg:"El listado de campos es obligatorio",
        errors:errors.mapped()})
    }

    next()
}

