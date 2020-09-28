using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class SkinEffect_Light : SkinEffect
{
    protected float time = 0;
    public Light light;

    public override void EffectUpdate()
    {
        // 기본값
        EffectUpdateDecision();
    }

    public abstract void EffectUpdateDecision();
}