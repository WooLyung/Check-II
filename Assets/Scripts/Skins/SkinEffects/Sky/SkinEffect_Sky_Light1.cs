using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkinEffect_Sky_Light1 : SkinEffect_Light
{
    public override void EffectUpdateDecision()
    {
        time += Time.deltaTime;

        if (time <= 2) // 축소
        {
            float x = time * time / 4;
            light.intensity = 20 - x * 10;
        }
        else if (time <= 4)
        {
            float x = (time - 2) * (time - 2) / 4;
            light.intensity = 10 + x * 10;
        }
        else
        {
            time = 0;
        }
    }
}
